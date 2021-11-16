// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        public external interface A<T, V> <: C & I where T<:Int32, V<:C & A {}
    )
    let expr = ParseDecl(input)
    if (expr.isInterfaceDecl()) {
        var b = expr.asInterfaceDecl()
        if (b.getModifiers().toString().trim() != "public external"){
            return 2
        }
        if (b.getKeyword().value != "interface"){
            return 3
        }
        if (b.getIdentifier().value != "A"){
            return 4
        }
        if (b.getSuperTypes()[0].asRefType().getIdentifier().value != "C"){
            return 5
        }
        if (b.getSuperTypes()[1].asRefType().getIdentifier().value != "I"){
            return 6
        }
        if (b.getBody().size() != 0){
            return 7
        }
        if (b.getGeneric().getTypeParameters().toString().trim() != "T V"){
            return 8
        }
        if (b.getGeneric().getConstraints()[0].getType().getIdentifier().value != "T"){
            return 9
        }
        if (b.getGeneric().getConstraints()[0].getUpperBound()[0].asPrimitiveType().getPrimitive().value != "Int32"){
            return 10
        }
        if (b.getGeneric().getConstraints()[1].getUpperBound()[0].asRefType().getIdentifier().value != "C"){
            return 11
        }
        if (b.getGeneric().getConstraints()[1].getUpperBound()[1].asRefType().getIdentifier().value != "A"){
            return 12
        }

        return 0
    }
    return 1
}
