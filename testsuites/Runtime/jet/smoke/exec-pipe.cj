// 'EXEC-PIPE' equals to 'EXEC-PIPE-0'.
// 'EXEC-PIPE-0' will split one command 'a | b' into 'a' and 'b'.
// We only allow return code of 'a' be 0.
// Stdout of 'a' will be stdin of 'b'.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan example EXEC-PIPE success

func main(){
print("example EXEC-PIPE success\n")
return 0
}
