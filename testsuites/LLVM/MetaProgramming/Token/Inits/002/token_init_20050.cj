// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan description: bit_xor_assign


from ast import ast.*


func main(){
    var a = Token(BITXOR_ASSIGN,"^=")
    a.dump()
}
