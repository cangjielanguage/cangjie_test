// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped

func main():Int64 {
    return 0
}

class Foo {
    static func h() {}
}

extend Foo {
    redef static func h() {} // EXPECTED: regex 'redef' modifier is illegal for function declaration in extend body
}
