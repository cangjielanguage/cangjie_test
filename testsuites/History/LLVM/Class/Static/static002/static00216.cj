// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface X{
    func i(){}
}

interface A{
    let a = super.i() // EXPECTED: regex 'super' is not allowed to initialize static member
}

open class Y{
    func i(){}
}

class B <: Y{
    static let a = super.i() // EXPECTED: regex 'super' is not allowed to initialize static member
}

abstract class Z{
    func i(){}
    func j():Unit
}

abstract class C <: Z{
    static let a = super.i() // EXPECTED: regex 'super' is not allowed to initialize static member
    static let b = super.j() // EXPECTED: regex 'super' is not allowed to initialize static member
}

func main(){
    return 1
}
