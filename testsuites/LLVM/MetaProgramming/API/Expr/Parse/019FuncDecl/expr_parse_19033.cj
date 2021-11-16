// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote(func bar():Int64{ func foo(){} })
    let expr = ParseDecl(input)
    if (expr.isFuncDecl()){
        let b = expr.asFuncDecl()
        if (b.getIdentifier().value != "bar") {
            return 1
        }
        if (b.getBody()[0].asDecl().asFuncDecl().getIdentifier().value != "foo") {
            return 2
        }
        if (b.getType().asPrimitiveType().getPrimitive().value != "Int64") {
            return 3
        }
        if (b.getParamList().getParams().size() != 0) {
            return 4
        }
        return 0
    }
    return 10
}
