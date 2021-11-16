// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f


func test(): Int64 {
return [1].size(1) // EXPECTED: regex no matching function declaration for function call
}

func main(): Int64 {
return test()
}
