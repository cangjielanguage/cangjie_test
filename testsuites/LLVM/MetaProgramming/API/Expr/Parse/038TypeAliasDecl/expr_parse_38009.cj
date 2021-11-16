// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args
from ast import ast.*
from std import unicode.*

func main() {
    var input: Tokens = quote(
         external type A<T, V> = B<Int64>
    )
    let aDec = ParseTypeAliasDecl(input)
    if (aDec.getModifiers().toString().trim() != "external") {
        return 2
    }
    if (aDec.getKeyword().value != "type") {
        return 3
    }
    if (aDec.getIdentifier().value != "A"){
        return 4
    }
    if (aDec.getType().asRefType().getIdentifier().value != "B") {
        return 5
    }
    if (aDec.getType().asRefType().getArgs()[0].asPrimitiveType().getPrimitive().value != "Int64") {
        return 6
    }
    if (aDec.getGeneric().getTypeParameters().toString().trim() != "T V") {
        return 7
    }
    return 0
}
