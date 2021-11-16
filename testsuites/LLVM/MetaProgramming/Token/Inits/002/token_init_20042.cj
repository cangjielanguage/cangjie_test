// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan description: unsafe_add_assign


from ast import ast.*


func main(){
    var a = Token(UNSAFEADD_ASSIGN,"+&=")
    a.dump()
}
