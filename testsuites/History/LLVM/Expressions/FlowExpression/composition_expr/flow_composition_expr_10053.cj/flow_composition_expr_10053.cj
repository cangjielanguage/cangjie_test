// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" > ast.conf
// EXEC: %compiler %cmp_opt -i ast.conf -backend-options=%libdir/../lib/libcangjie-common.so  %f -o %output
// EXEC: %run %run_opt %output %run_args

import ast.*

trait X{func asFunc(x:This,y:Tokens):Tokens}
append Tokens with X{func asFunc(x:Tokens,y:Tokens):Tokens{quote(0)}}


func main(): Int64 {
    quote(1) |> quote(1)
    return 0
}
