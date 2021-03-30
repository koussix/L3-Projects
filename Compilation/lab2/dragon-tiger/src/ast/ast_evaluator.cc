#include "ast_evaluator.hh"
#include "../utils/errors.hh"



namespace ast{
int32_t ASTEvaluator::visit(const IntegerLiteral &litteral){
    return litteral.value;
}

int32_t ASTEvaluator::visit(const StringLiteral &Str){
    utils::error("we are in a string node");
}

int32_t ASTEvaluator::visit(const BinaryOperator &bop){
    //bop.accept(*this);
    int32_t val1 = bop.get_left().accept(*this);
    int32_t val2 = bop.get_right().accept(*this);

    switch (bop.op)
    {
    case 0 : return val1 + val2; break; // enum 0 -> + 
    case 1 : return val1 - val2; break;
    case 2 : return val1 * val2; break;
    case 3 : return val1 / val2; break;
    case 4 : return val1==val2 ? 1 : 0;
    case 5 : return val1!=val2 ? 1 : 0;
    case 6 : return val1< val2 ? 1 : 0;
    case 7 : return val1<=val2 ? 1 : 0;
    case 8 : return val1> val2 ? 1 : 0;
    case 9 : return val1>=val2 ? 1 : 0;
    default: utils::error("AST EVALUATION ERROR FOR BINARY OPERATOR");
        break;
    }
}
int32_t ASTEvaluator::visit(const Sequence &seq){ 
    const auto exprs = seq.get_exprs();
    if(exprs.empty()) // vide
        utils::error("The expression is empty");
    
    Expr* ex = NULL;
    for(auto expr = exprs.cbegin(); expr != exprs.cend() ;expr++){
            (*expr)->accept(*this);
            ex = *expr;
    }
    return ex->accept(*this);
}
int32_t ASTEvaluator::visit(const Let &){
    utils::error("we are in a let node");
}
int32_t ASTEvaluator::visit(const Identifier &){
    utils::error("we are in an idetifier node");
}

int32_t ASTEvaluator::visit(const IfThenElse &cond){ 
    if( cond.get_condition().accept(*this) )  // laisser le visiteur acceder au noeud
        return cond.get_then_part().accept(*this); // return the then part
    else{
        const Expr& e = cond.get_else_part();
        if (e.loc == nl){ // je verifie si le else existe 
            utils::error("no else close");
        }
        else 
            return e.accept(*this);
    }   
}
int32_t ASTEvaluator::visit(const VarDecl &){
    utils::error("we are in an vardecl node");
}
int32_t ASTEvaluator::visit(const FunDecl &){
    utils::error("we are in an fundecl node");
}   
int32_t ASTEvaluator::visit(const FunCall &){
    utils::error("we are in an funcall node");
}
int32_t ASTEvaluator::visit(const WhileLoop &){
    utils::error("we are in an whileloop node");
}
int32_t ASTEvaluator::visit(const ForLoop &){
    utils::error("we are in an forloop node");
}
int32_t ASTEvaluator::visit(const Break &){
    utils::error("we are in an break node");
}
int32_t ASTEvaluator::visit(const class Assign &){
    utils::error("we are in an assign node");
}
}
