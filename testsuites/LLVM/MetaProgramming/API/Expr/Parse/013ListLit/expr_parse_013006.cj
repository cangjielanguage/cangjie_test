// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var input: Tokens = quote([1,2,3,*[a,b,c]])
    let expr = ParseListLit(input)
    if (expr.getChildren()[0].asLitConstExpr().getLiteral().value != "1"){
        return 1
    }
    if (expr.getChildren()[1].asLitConstExpr().getLiteral().value != "2"){
        return 2
    }
    if (expr.getChildren()[2].asLitConstExpr().getLiteral().value != "3"){
        return 3
    }
    if (expr.getChildren()[3].asListSpreadExpr().getChild().asListLit().getChildren()[1].asRefExpr().getIdentifier().value != "b"){
            return 3
    }
    return 0
}
