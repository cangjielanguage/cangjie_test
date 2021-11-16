// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            var a = b + 1
        } catch(e1: RunTime) {
            e1.back_trace()
        } catch(e2: Argument) {
            e2.back_trace()
        } catch(e3: Int64) {
            e3.back_trace()
        } finally {
            a = 2
        }
    )
    let expr = ParseExpr(input)
    if (expr.isTryExpr()) {
        var b = expr.asTryExpr()

        if (b.getTryBlock().getBody()[0].asDecl().asVarDecl().getInitializer().asBinaryExpr().getLeftExpr().asRefExpr().getIdentifier().value != "b") {
            return 2
        }
        if (!b.getCatchPatterns()[0].isExceptTypePattern()){
            return 3
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "RunTime"){
            return 4
        }
        if (b.getCatchPatterns()[1].asExceptTypePattern().getTypes()[0].asRefType().getIdentifier().value != "Argument"){
            return 5
        }
        if (b.getCatchPatterns()[2].asExceptTypePattern().getTypes()[0].asPrimitiveType().getPrimitive().value != "Int64"){
            return 6
        }
        if (b.getCatchBlocks()[0].getBody()[0].asExpr().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "e1") {
            return 7
        }
        if (b.getCatchBlocks()[1].getBody()[0].asExpr().asCallExpr().getBaseFunc().asMemberAccess().getField().value != "back_trace") {
            return 8
        }
        if (b.getCatchBlocks()[2].getBody()[0].asExpr().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "e3") {
            return 9
        }
        if (!b.hasFinallyBlock()){
            return 10
        }
        if (b.getFinallyBlock().getBody()[0].asExpr().asAssignExpr().getLeftValue().asRefExpr().getIdentifier().value != "a") {
            return 11
        }
        return 0
    }
    return 1
}
