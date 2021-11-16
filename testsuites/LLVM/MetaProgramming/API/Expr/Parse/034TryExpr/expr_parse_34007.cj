// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try (input: Stream = FileInputStream("input.txt"),
            output: Stream = FileOutputStream("output.txt")) {
            while (input.hasNextLine()) {
                let lineString = input.readLine()
                output.writeLine(lineString)
            }
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (b.getTryBlock().getBody()[0].asExpr().asWhileExpr().getCondExpr().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "input") {
            return 2
        }
        if (b.getCatchPatterns().size() !=0 ){
            return 3
        }
        if (b.hasFinallyBlock()){
            return 7
        }
        return 0
    }
    return 1
}
