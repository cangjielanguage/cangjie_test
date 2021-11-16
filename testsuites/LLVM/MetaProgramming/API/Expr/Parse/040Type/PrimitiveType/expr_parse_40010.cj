// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

// all of PrimitiveType
func main(): Int64 {
    var input : Tokens = quote(
        a is Int8*Int16*Int32*Int64*UInt8*UInt16*UInt32*UInt64*Float16*Float32*Float64*Char*Bool*Unit
    )
    let expr = ParseExpr(input)
    if (expr.isIsExpr()) {
        var tp = expr.asIsExpr().getType()
        if (!tp.isTupleType()) {
            return 2
        }
        if (tp.asTupleType().getFieldTypes()[0].asPrimitiveType().getPrimitive().value != "Int8") {
            return 3
        }
        if (tp.asTupleType().getFieldTypes()[1].asPrimitiveType().getPrimitive().value != "Int16") {
            return 4
        }
        if (tp.asTupleType().getFieldTypes()[2].asPrimitiveType().getPrimitive().value != "Int32") {
            return 5
        }
        if (tp.asTupleType().getFieldTypes()[3].asPrimitiveType().getPrimitive().value != "Int64") {
            return 6
        }
        if (tp.asTupleType().getFieldTypes()[4].asPrimitiveType().getPrimitive().value != "UInt8") {
            return 7
        }
        if (tp.asTupleType().getFieldTypes()[5].asPrimitiveType().getPrimitive().value != "UInt16") {
            return 8
        }
        if (tp.asTupleType().getFieldTypes()[6].asPrimitiveType().getPrimitive().value != "UInt32") {
            return 9
        }
        if (tp.asTupleType().getFieldTypes()[7].asPrimitiveType().getPrimitive().value != "UInt64") {
            return 10
        }
        if (tp.asTupleType().getFieldTypes()[8].asPrimitiveType().getPrimitive().value != "Float16") {
            return 11
        }
        if (tp.asTupleType().getFieldTypes()[9].asPrimitiveType().getPrimitive().value != "Float32") {
            return 12
        }
        if (tp.asTupleType().getFieldTypes()[10].asPrimitiveType().getPrimitive().value != "Float64") {
            return 13
        }
        if (tp.asTupleType().getFieldTypes()[11].asPrimitiveType().getPrimitive().value != "Char") {
            return 14
        }
        if (tp.asTupleType().getFieldTypes()[12].asPrimitiveType().getPrimitive().value != "Bool") {
            return 15
        }
        if (tp.asTupleType().getFieldTypes()[13].asPrimitiveType().getPrimitive().value != "Unit") {
            return 15
        }
        return 0
    }
    return 1
}
