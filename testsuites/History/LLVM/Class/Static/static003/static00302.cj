// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A{
    let a : Int64 = 1
    static func test():Int64{1}
}

class X <: A{}

abstract class Y <: A{}


func main(){
    X.test() // EXPECTED: regex 'test' is not a member of class 'X'
    X.a // EXPECTED: regex 'a' is not a member of class 'X'
    Y.test() // EXPECTED: regex 'test' is not a member of class 'Y'
    Y.a // EXPECTED: regex 'a' is not a member of class 'Y'
    return 0
}