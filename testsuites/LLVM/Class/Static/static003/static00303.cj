// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A{
    let a : Int64 = 1
    static func test():Int64{1}
}

class X <: A{
    let a : Int64 = 2
    static func test():Int64{2}
}

abstract class Y <: A{
    let a : Int64 = 3
    static func test():Int64{2}
}


func main(){
    if (X.a != 2) { // EXPECTED: regex 'a' is non-static member, cannot access by type name
        return 2
    }
    if (Y.a != 3) { // EXPECTED: regex 'a' is non-static member, cannot access by type name
        return 3
    }
    if (X.test() != 2) {
        return 4
    }
    if (Y.test() != 3) {
        return 5
    }
    return 0
}