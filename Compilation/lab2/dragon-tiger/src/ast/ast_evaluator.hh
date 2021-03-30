#ifndef AST_EVALUATOR_HH
#define AST_EVALUATOR_HH

#include <ostream>

#include "nodes.hh"

namespace ast {

class ASTEvaluator : public ConstASTIntVisitor {
  std::ostream *ostream;
  bool verbose;
 
public:
    ASTEvaluator(std::ostream *_ostream, bool _verbose): ostream(_ostream), verbose(_verbose) {}

    virtual int32_t visit(const class IntegerLiteral &);
    virtual int32_t visit(const class StringLiteral &);
    virtual int32_t visit(const class BinaryOperator &);
    virtual int32_t visit(const class Sequence &);
    virtual int32_t visit(const class Let &);
    virtual int32_t visit(const class Identifier &);
    virtual int32_t visit(const class IfThenElse &);
    virtual int32_t visit(const class VarDecl &);
    virtual int32_t visit(const class FunDecl &);
    virtual int32_t visit(const class FunCall &);
    virtual int32_t visit(const class WhileLoop &);
    virtual int32_t visit(const class ForLoop &);
    virtual int32_t visit(const class Break &);
    virtual int32_t visit(const class Assign &);
};

} // namespace ast

#endif // _AST_EVALUATOR_HH
