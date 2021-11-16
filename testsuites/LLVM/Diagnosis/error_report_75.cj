// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    let fut: Int64 = spawn {print("hello")} // EXPECTED: regex wrong type for variable which is initialized by a spawn expression
    return 0
}