// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class GrandFather {}

open class Father <: GrandFather {
    Father(
        public var a: Int64
        ) {}
}

class Child <: Father {
    Child(
        public var a: Int64    // EXPECTED: regex error.*? the variable 'a' must not shadow a member variable of the supertype
    ) {
        super(a)
    }
}