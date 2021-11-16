// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

enum Foo {
    redef static func h() {} // EXPECTED: regex error.*? invalid constructor in enum declaration
}