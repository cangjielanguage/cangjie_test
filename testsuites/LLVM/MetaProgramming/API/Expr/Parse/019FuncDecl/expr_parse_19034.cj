// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(public func foo<T,V>(a:T,b!:Int64=1):Int64 where T<: B,V <: Int64{})
    let expr = ParseFuncDecl(input)
    if (expr.getModifiers().toString().trim() != "public") {
        return 1
    }
    if (expr.getParamList().getParams()[0].getIdentifier().value != "a") {
        return 21
    }
    if (expr.getParamList().getParams()[0].getType().asRefType().getIdentifier().value != "T") {
        return 22
    }
    if (expr.getParamList().getParams()[1].getAssignment().asLitConstExpr().getLiteral().value != "1") {
        return 23
    }
    if (expr.getParamList().getParams()[1].getType().asPrimitiveType().getPrimitive().value != "Int64") {
        return 24
    }
    if (expr.getIdentifier().value != "foo") {
        return 3
    }
    if (expr.getType().asPrimitiveType().getPrimitive().value != "Int64") {
        return 3
    }
    if (expr.getBody().size() != 0) {
        return 4
    }
    if (expr.getGeneric().getTypeParameters().toString().trim()!= "T V") {
        return 5
    }
    if (expr.getGeneric().getConstraints()[0].getType().getIdentifier().value!= "T") {
        return 6
    }
    if (expr.getGeneric().getConstraints()[0].getUpperBound()[0].asRefType().getIdentifier().value!= "B") {
        return 8
    }
    if (expr.getGeneric().getConstraints()[1].getType().getIdentifier().value!= "V") {
        return 9
    }
    if (expr.getGeneric().getConstraints()[1].getUpperBound()[0].asPrimitiveType().getPrimitive().value != "Int64") {
        return 10
    }
    return 0
}
