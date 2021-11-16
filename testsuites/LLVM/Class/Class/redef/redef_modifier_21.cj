// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

interface Aoo {
    static func foo() {
        return 1
    }
}

interface Boo <: Aoo {
    redef static func foo() { // EXPECTED: regex error.*?'redef' modifier is illegal for function declaration in interface body
        return 2
    }
}