// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

let str: String // EXPECTED: regex-auto variable 'str' in top level should have initializer

func run(): Int64 {
str = "Hello Char Lang"
print("StringTest: " + str)
return 0
}

func main(): Int64 {
return run()
}
