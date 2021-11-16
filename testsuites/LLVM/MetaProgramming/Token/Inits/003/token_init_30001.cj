// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Exception RuntimeException IllegalArgumentException TokenKind, Value not matched.


from ast import ast.*


func main(){
    var a = Token(DOT,"abc")
    a.dump()
}
