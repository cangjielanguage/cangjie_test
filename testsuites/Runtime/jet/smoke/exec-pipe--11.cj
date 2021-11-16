// 'EXEC-PIPE-number' support negative number.
// 'EXEC-PIPE-number' will split one command 'a | b' into 'a' and 'b'.
// We only allow return code of 'a' be 0.
// Stdout of 'a' will be stdin of 'b'.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE--11: %run %run_opt %output %run_args | compare %f

// ASSERT:scan example EXEC-PIPE--11 success

func main(){
print("example EXEC-PIPE--11 success\n")
return -11
}
