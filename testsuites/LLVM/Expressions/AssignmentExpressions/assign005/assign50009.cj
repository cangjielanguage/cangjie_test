// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

let l_a : Int32 = 4

record A{
l_a = 1 // EXPECTED: regex illegal record member in record block
l_a ++
l_a --
}

func main(): Int64 {
    return 1
}
