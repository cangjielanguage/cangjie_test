// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Foo {
    redef static var a = 1  // EXPECTED: regex error.*? 'redef' modifier is illegal for variable declaration in record body
}