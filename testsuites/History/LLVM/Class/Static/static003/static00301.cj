// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A{
    let a : Int64 = 1
    static func test():Int64{1}
}

interface X <: A{}

open class B{
    static let a : Int64 = 1
    static func test():Int64{1}
}

class Y <: B{}

abstract class C{
    static let a : Int64 = 1
    static func test():Int64{1}
}

class Z <: C{}

func main(){
    X.test() // EXPECTED: regex 'test' is not a member of interface 'X'
    X.a // EXPECTED: regex 'a' is not a member of interface 'X'
    Y.test() // EXPECTED: regex 'test' is not a member of class 'Y'
    Y.a // EXPECTED: regex 'a' is not a member of class 'Y'
    Z.test() // EXPECTED: regex 'test' is not a member of class 'Z'
    Z.a // EXPECTED: regex 'a' is not a member of class 'Z'
    return 0
}