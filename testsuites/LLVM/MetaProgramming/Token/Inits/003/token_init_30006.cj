// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan ab


from ast import ast.*


func main(){
    var c = Tokens()
    print("a")
    c.dump()
    print("b")
}
