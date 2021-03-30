#include <sstream>

#include "binder.hh"
#include "../utils/errors.hh"
#include "../utils/nolocation.hh"

using utils::error; 
using utils::non_fatal_error;

namespace ast {
namespace binder {

/* Returns the current scope */
scope_t &Binder::current_scope() { return scopes.back(); }

/* Pushes a new scope on the stack */
void Binder::push_scope() { scopes.push_back(scope_t()); }

/* Pops the current scope from the stack */
void Binder::pop_scope() { scopes.pop_back(); }

/* Enter a declaration in the current scope. Raises an error if the declared name
 * is already defined */
void Binder::enter(Decl &decl) {
  scope_t &scope = current_scope();
  auto previous = scope.find(decl.name);
  if (previous != scope.end()) {
    non_fatal_error(decl.loc,
                    decl.name.get() + " is already defined in this scope");
    error(previous->second->loc, "previous declaration was here");
  }
  scope[decl.name] = &decl;
}

/* Finds the declaration for a given name. The scope stack is traversed
 * front to back starting from the current scope. The first matching
 * declaration is returned. Raises an error, if no declaration matches. */
Decl &Binder::find(const location loc, const Symbol &name) {
  for (auto scope = scopes.crbegin(); scope != scopes.crend(); scope++) {
    auto decl_entry = scope->find(name);
    if (decl_entry != scope->cend()) {
      return *decl_entry->second;
    }
  }
  error(loc, name.get() + " cannot be found in this scope");
}

Binder::Binder() : scopes() {
  /* Create the top-level scope */
  push_scope();

  /* Populate the top-level scope with all the primitive declarations */
  const Symbol s_int = Symbol("int");
  const Symbol s_string = Symbol("string");
  enter_primitive("print_err", boost::none, {s_string});
  enter_primitive("print", boost::none, {s_string});
  enter_primitive("print_int", boost::none, {s_int});
  enter_primitive("flush", boost::none, {});
  enter_primitive("getchar", s_string, {});
  enter_primitive("ord", s_int, {s_string});
  enter_primitive("chr", s_string, {s_int});
  enter_primitive("size", s_int, {s_string});
  enter_primitive("substring", s_string, {s_string, s_int, s_int});
  enter_primitive("concat", s_string, {s_string, s_string});
  enter_primitive("strcmp", s_int, {s_string, s_string});
  enter_primitive("streq", s_int, {s_string, s_string});
  enter_primitive("not", s_int, {s_int});
  enter_primitive("exit", boost::none, {s_int});
  depth=0;
  marqueur_break =0;
  my_loop_depth = 0;
}

/* Declares a new primitive into the current scope*/
void Binder::enter_primitive(
    const std::string &name, const boost::optional<Symbol> &type_name,
    const std::vector<Symbol> &argument_typenames) {
  std::vector<VarDecl *> args;
  int counter = 0;
  for (const Symbol &tn : argument_typenames) {
    std::ostringstream argname;
    argname << "a_" << counter++;
    args.push_back(
        new VarDecl(utils::nl, Symbol(argname.str()), tn, nullptr));
  }

  boost::optional<Symbol> type_name_symbol = boost::none;
  FunDecl *fd = new FunDecl(utils::nl, Symbol(name), type_name, std::move(args), nullptr,
                            true);
  fd->set_external_name(Symbol("__" + name));
  enter(*fd);
}

/* Sets the parent of a function declaration and computes and sets
 * its unique external name */
void Binder::set_parent_and_external_name(FunDecl &decl) {
  auto parent = functions.empty() ? nullptr : functions.back();
  Symbol external_name;
  if (parent) {
    decl.set_parent(parent);
    external_name = parent->get_external_name().get() + '.' + decl.name.get();
  } else
    external_name = decl.name;
  while (external_names.find(external_name) != external_names.end())
    external_name = Symbol(external_name.get() + '_');
  external_names.insert(external_name);
  decl.set_external_name(external_name);
}

/* Binds a whole program. This method wraps the program inside a top-level main
 * function.  Then, it visits the programs with the Binder visitor; binding
 * each identifier to its declaration and computing depths.*/
FunDecl *Binder::analyze_program(Expr &root) {
  //std::cout << "ANALYZE PROGRAM"<<std::endl;
  std::vector<VarDecl *> main_params;
  Sequence *const main_body = new Sequence(
      utils::nl,
      std::vector<Expr *>({&root, new IntegerLiteral(utils::nl, 0)}));
  FunDecl *const main = new FunDecl(utils::nl, Symbol("main"), Symbol("int"),
                                    main_params, main_body, true);
  main->accept(*this);
  return main;
}

void Binder::visit(IntegerLiteral &literal) {

}

void Binder::visit(StringLiteral &literal) {
}

void Binder::visit(BinaryOperator &op) {
  op.get_left().accept(*this);
  op.get_right().accept(*this);
  
}

void Binder::visit(Sequence &seq) {
  const auto exprs = seq.get_exprs();

  for (auto expr = exprs.cbegin(); expr != exprs.cend(); expr++) {
    (*expr)->accept(*this);
  }
  
}

void Binder::visit(Let &let) {
  std::vector<FunDecl *> funsave;
  FunDecl* fd ;
  push_scope();

  for( auto dec : let.get_decls()){
    fd = dynamic_cast<FunDecl*> (dec);
    if(fd != NULL){
      funsave.push_back(fd);
      marqueur_break = 0;
      this->enter(*dec);
    }
    else{

      //un noeud vardecl, on l'accepte
      marqueur_break = 0;
      dec->accept(*this);
      
      //on depile la pile et on accepte sur chaque fundecl
      while(funsave.size()>0){
        funsave[funsave.size()-1]->accept(*this);
        funsave.pop_back();
      }

    } 
  }
  // on verifie que la pile n'est pas vide ce qui peut etre possible si 
  // on a pas trouvé de variable apres nos declaration de fonction
  while(funsave.size()>0){
    funsave[funsave.size()-1]->accept(*this);
    funsave.pop_back();
  }

  Sequence &s = let.get_sequence();
  visit(s);
  pop_scope();

}

void Binder::visit(Identifier &id) {
  Decl& decl = find( id.loc , id.name);
  VarDecl* vd = dynamic_cast<VarDecl*> (&decl);
  id.set_depth(depth);
  if(vd != NULL){
      id.set_decl(vd);
  }
  else
  {
    utils::error("le dynamic cast est erroné dans identifier ");
  }
  if( id.get_depth() - vd->get_depth() > 0){ 
      vd->set_escapes(); 
  }
  //on verifie de maniere implicite que c'est une boucle avec le my_loop_depth
  if( vd->read_only && my_loop_depth>=2){
    vd->set_escapes();
  }
  
}

void Binder::visit(IfThenElse &ite) {

    ite.get_condition().accept(*this);
    ite.get_then_part().accept(*this);
    ite.get_else_part().accept(*this);
}

void Binder::visit(VarDecl &decl) {
  if(auto expr = decl.get_expr())
  {
    expr->accept(*this);
  }
  this->enter(decl);
  decl.set_depth(depth);

}

void Binder::visit(FunDecl &decl) {
  set_parent_and_external_name(decl);
  functions.push_back(&decl);
  
  push_scope();
  decl.set_depth(depth);
  depth++;
  for( auto dec = decl.get_params().cbegin(); dec != decl.get_params().cend(); dec++){
    (*dec)->accept(*this);
  }
  const auto exprs = decl.get_expr();
  exprs->accept(*this);

  depth--;
  pop_scope();
  functions.pop_back();
}

void Binder::visit(FunCall &call) {
  Decl& decl = find( call.loc , call.func_name);
  FunDecl* vd = dynamic_cast<FunDecl*> (&decl);
  if(vd != NULL){
    call.set_decl(vd);
  }
  else
  {
    utils::error("Erreur dynamic dast dans funcall");
  }

  for( auto dec = call.get_args().cbegin(); dec != call.get_args().cend(); dec++ ){
    (*dec)->accept(*this);
  }
  call.set_depth(depth);

}

void Binder::visit(WhileLoop &loop) {
  if(loops_binding.empty()){
    loops_binding.push_back(&loop);
    this->push_scope();
    my_loop_depth++;
    loop.get_condition().accept(*this);
    marqueur_break = 1;
    loop.get_body().accept(*this);
    this->pop_scope();
    my_loop_depth--;
    loops_binding.pop_back();
  }else
  { 
    this->push_scope();
    my_loop_depth++;
    marqueur_break = 1;
    loop.get_condition().accept(*this);
    loops_binding.push_back(&loop);
    loop.get_body().accept(*this);
    loops_binding.pop_back();
    this->pop_scope();
    my_loop_depth--;
    
  }
  
  

}

void Binder::visit(ForLoop &loop) {

  if(loops_binding.empty()){
    loops_binding.push_back(&loop);
    this->push_scope();
    my_loop_depth++;
    loop.get_variable().accept(*this);
    loop.get_high().accept(*this);
    marqueur_break = 1;
    loop.get_body().accept(*this);
    this->pop_scope();
    my_loop_depth--;
    loops_binding.pop_back();
  }
  else
  {
   this->push_scope();
   my_loop_depth++;
   loop.get_variable().accept(*this);
   marqueur_break = 1; 
   loop.get_high().accept(*this);
   loops_binding.push_back(&loop);
   loop.get_body().accept(*this);
   this->pop_scope();
   my_loop_depth--;
   loops_binding.pop_back();  
  }

}

void Binder::visit(Break &b) {
    
    if (!loops_binding.empty() && marqueur_break==1){
      //ce n'est pas vide donc on reference le break à sa loop
      b.set_loop(loops_binding[loops_binding.size()-1]);
    }
    else
    { 
      //les loops sont vides donc le break est surement utilisé ailleurs
      utils::error("Utilisation du break hors d'une boucle");
    }
    
}

void Binder::visit(Assign &assign) {

    assign.get_lhs().accept(*this);
    if(assign.get_lhs().get_decl())
      if(assign.get_lhs().get_decl()->read_only)
        utils::error("Fatal error : Assignement of a loop index is not allowed");
  
    assign.get_rhs().accept(*this);
}

} // namespace binder
} // namespace ast
