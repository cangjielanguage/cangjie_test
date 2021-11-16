// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
[1].iterator(1) // EXPECTED: regex no matching function declaration for function call
return 0
}

func main(): Int64 {
test()
}
