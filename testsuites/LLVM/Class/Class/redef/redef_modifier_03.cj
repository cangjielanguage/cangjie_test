// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo {
    static func foo() {
        return 1
    }
}

class Coo <: Boo {
    redef func foo() { /// EXPECTED: regex error.*?expected 'static' after 'redef'
        return 2
    }
}