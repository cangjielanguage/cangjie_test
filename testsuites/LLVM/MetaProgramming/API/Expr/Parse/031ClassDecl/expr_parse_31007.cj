// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        public open class A<T, V> <: C & I where T<:Int32, V<:C & A {}
    )
    let expr = ParseClassDecl(input)
    if (expr.getModifiers().toString().trim() != "public open"){
        return 2
    }
    if (expr.getKeyword().value != "class"){
        return 3
    }
    if (expr.getIdentifier().value != "A"){
        return 4
    }
    if (expr.getSuperTypes()[0].asRefType().getIdentifier().value != "C"){
        return 5
    }
    if (expr.getSuperTypes()[1].asRefType().getIdentifier().value != "I"){
        return 6
    }
    if (expr.getBody().size() != 0){
        return 7
    }
    if (expr.getGeneric().getTypeParameters().toString().trim() != "T V"){
        return 8
    }
    if (expr.getGeneric().getConstraints()[0].getType().getIdentifier().value != "T"){
        return 9
    }
    if (expr.getGeneric().getConstraints()[0].getUpperBound()[0].asPrimitiveType().getPrimitive().value != "Int32"){
        return 10
    }
    if (expr.getGeneric().getConstraints()[1].getUpperBound()[0].asRefType().getIdentifier().value != "C"){
        return 11
    }
    if (expr.getGeneric().getConstraints()[1].getUpperBound()[1].asRefType().getIdentifier().value != "A"){
        return 12
    }

    return 0

}
