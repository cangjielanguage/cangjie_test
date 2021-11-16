// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo {
    public var a = 1
}

class Coo <: Boo {
    redef var a = 2  // EXPECTED: regex error.*?'redef' modifier is illegal for variable declaration in class body
}