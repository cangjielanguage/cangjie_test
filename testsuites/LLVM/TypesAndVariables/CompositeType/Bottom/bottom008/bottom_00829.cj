// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f

func test():Int64 {
var a : Bool =   // EXPECTED: regex initializer's type is incompatible with variable declaration 'a'
{0}
if (a) {
return 1
} else {
return 2
}
}

func main(): Int64 {
return test()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
