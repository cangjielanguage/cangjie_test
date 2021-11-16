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
        } catch (e: IOException) {
            print("IOException happened when executing the try-with-resources expression")
        } finally {
            print("end of the try-with-resources expression")
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()
        if (b.getTryBlock().getBody()[0].asExpr().asWhileExpr().getCondExpr().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "input") {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 3
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "IOException"){
            return 4
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getPattern().isWildcardPattern()){
            return 5
        }
        if (b.getCatchBlocks()[0].getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "print") {
            return 6
        }
        if (!b.hasFinallyBlock()){
            return 7
        }
        if (b.getFinallyBlock().getBody()[0].asExpr().asCallExpr().getBaseFunc().asRefExpr().getIdentifier().value != "print") {
            return 8
        }
        return 0
    }
    return 1
}
