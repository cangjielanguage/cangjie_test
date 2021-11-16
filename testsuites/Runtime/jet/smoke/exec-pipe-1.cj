// 'EXEC-PIPE-1' will split one command 'a | b' into 'a' and 'b'.
// We allow return code of 'a' be 1.
// Stdout of 'a' will be stdin of 'b'.

// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT:scan return type of entry function 'main' is not 'Integer' or 'Unit'

func main(): String{}
