// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan description: pipeline


from ast import ast.*


func main(){
    var a = Token(PIPELINE,"|>")
    a.dump()
}
