// EXEC: echo "ast=%libdir/ast/cangjieAST.cjo" > ast.conf
// EXEC: %compiler %cmp_opt -i ast.conf  -backend-options=%libdir/../lib/libcangjie-common.so %f -o %output
// EXEC: %run %run_opt %output %run_args

import ast.*

trait X {
    func asFunc(input:This):This
}
append Tokens with X{
    func asFunc(input:Tokens):Tokens{input}
}



func main(): Int64 {
    quote(1())()
    return 0
}
