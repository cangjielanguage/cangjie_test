// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class GrandFather {
    GrandFather( public var a : Int64 ) {}
}

open class Father <: GrandFather {
    Father(a : Int64){
        super(a)
    }
}

class Child <: Father {
    Child(
        public var a : Int64  // EXPECTED: regex error.*? the variable 'a' must not shadow a member variable of the supertype
    ) {
        super(a)
    }
}