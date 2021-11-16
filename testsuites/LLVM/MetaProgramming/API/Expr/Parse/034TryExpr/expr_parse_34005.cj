// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(
        try {
            var a = b + 1
        } catch(_: RunTime | Argument| ValueError) {
            e.back_trace()
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
        if (!b.getCatchPatterns()[0].asExceptTypePattern().getPattern().isWildcardPattern()){
            return 5
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[1].asRefType().getIdentifier().value != "Argument"){
            return 6
        }
        if (b.getCatchPatterns()[0].asExceptTypePattern().getTypes()[2].asRefType().getIdentifier().value != "ValueError"){
            return 7
        }
        if (b.getCatchBlocks()[0].getBody()[0].asExpr().asCallExpr().getBaseFunc().asMemberAccess().getBaseExpr().asRefExpr().getIdentifier().value != "e") {
            return 8
        }
        if (b.hasFinallyBlock()){
            return 9
        }
        return 0
    }
    return 1
}
