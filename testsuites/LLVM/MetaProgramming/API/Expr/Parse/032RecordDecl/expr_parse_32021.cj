// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*
from std import unicode.*

func main(): Int64 {
    var input : Tokens = quote(
        record A {
            redef prop var b: Int64 {}
        }
    )
    let expr = ParseDecl(input)
    if (expr.isRecordDecl()) {
        var b = expr.asRecordDecl()
        let propDeclOfRecord = b.getBody()[0].asPropDecl()
        if (propDeclOfRecord.getModifiers().toString().trim() != "redef"){
            return 5
        }
        return 0
    }
    return 1
}
