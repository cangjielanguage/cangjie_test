// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan description: and


from ast import ast.*


func main(){
    var a = Token(AND)
    a.dump()
}
