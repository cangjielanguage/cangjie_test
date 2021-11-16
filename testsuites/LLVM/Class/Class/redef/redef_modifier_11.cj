// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

interface Boo {
    static func foo() {
        return 1
    }
}

class Coo <: Boo {
    redef static func foo() {  // EXPECTED: regex invalid 'redef' modifier when implementing an abstract function
        return 3
    }
}
