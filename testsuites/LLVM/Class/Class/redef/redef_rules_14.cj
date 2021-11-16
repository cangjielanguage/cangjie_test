// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( C3.foo() != "abcabc" || C2.goo() != "xyzxyz" ) {
        return 1
    }
    return 0
}

open class C1 {
    static func foo() {
        return "abc"
    }
    static func goo() {
        return "xyz"
    }
}

open class C2 <: C1 {
    redef static func goo() {
        return "xyzxyz"
    }
}

class C3 <: C1 {
    redef static func foo() {
        return "abcabc"
    }
}