// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan description: dollar_identifier


from ast import ast.*


func main(){
    var a = Token(DOLLAR_IDENTIFIER,"my_value")
    a.dump()
}
