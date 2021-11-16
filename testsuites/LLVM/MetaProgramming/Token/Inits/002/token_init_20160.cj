// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan description: jstring_literal


from ast import ast.*


func main(){
    var a = Token(JSTRING_LITERAL,"my_value")
    a.dump()
}
