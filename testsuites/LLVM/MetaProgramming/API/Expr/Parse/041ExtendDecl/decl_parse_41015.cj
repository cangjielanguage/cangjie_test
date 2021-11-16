// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main(): Int64 {
    var input : Tokens = quote(
        extend A<T> <: C & ?A & p.A<Int64> where T<: Int32, V<: p.C & Array<A> & ()->Unit {
            public func foo<T>(a:T,b!:Int64=1):Int64 where T<: B {}
        }
    )
    let ex = ParseExtendDecl(input)
    if (ex.getKeyword().value != "extend") {
        return 2
    }
    if (ex.getExtendedType().asRefType().getIdentifier().value != "A" ) {
        return 3
    }
    if (ex.getMembers()[0].asFuncDecl().getIdentifier().value != "foo") {
        return 4
    }
    if (ex.getGenericConstraints()[0].getType().getIdentifier().value != "T") {
        return 5
    }
    if (ex.getGenericConstraints()[0].getUpperBound()[0].asPrimitiveType().getPrimitive().value != "Int32") {
        return 6
    }
    if (ex.getGenericConstraints()[1].getType().getIdentifier().value != "V") {
        return 7
    }
    if (ex.getGenericConstraints()[1].getUpperBound()[0].asQualifiedType().getBaseType().asRefType().getIdentifier().value != "p") {
        return 8
    }
    if (ex.getGenericConstraints()[1].getUpperBound()[1].asArrayType().getComponentType().asRefType().getIdentifier().value  != "A") {
        return 9
    }
    if (ex.getGenericConstraints()[1].getUpperBound()[2].asFuncType().getRetType().asPrimitiveType().getPrimitive().value != "Unit") {
        return 10
    }
    if (ex.getGenericConstraints().size() == 0) {
        return 11
    }
    if (ex.getSuperInterfaces()[0].asRefType().getIdentifier().value != "C" ) {
        return 12
    }
    if (ex.getSuperInterfaces()[1].asOptionType().getComponentType().asRefType().getIdentifier().value != "A" ) {
        return 13
    }
    if (ex.getSuperInterfaces()[2].asQualifiedType().getBaseType().asRefType().getIdentifier().value != "p" ) {
        return 14
    }
    return 0
}
