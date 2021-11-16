// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

class Boo {
    redef static func foo() { // EXPECTED: regex error.*?redefine function 'foo' does not have an redefined 'static' function
        return 2
    }
}