// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f



func test(): Bool {
return [1].isEmpty(1) // EXPECTED: regex no matching function declaration for function call
}

func main(): Int64 {
if (!test()) {
return 0
}
return 1
}
