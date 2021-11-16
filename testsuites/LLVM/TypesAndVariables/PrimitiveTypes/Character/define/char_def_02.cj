// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

let c: Char // EXPECTED: regex-auto variable 'c' in top level should have initializer

func run(): Int64 {
c = 'a'
print("charTest: " + c.toString())
return 0
}

func main(): Int64 {
return run()
}
