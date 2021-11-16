// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A{
    func i(){}
    let a = this.i() // EXPECTED: regex 'this' is not allowed to initialize static member
}

class B{
    func i(){}
    static let a = this.i() // EXPECTED: regex 'this' is not allowed to initialize static member
}

abstract class C{
    func i(){}
    func j():Unit
    static let a = this.i() // EXPECTED: regex 'this' is not allowed to initialize static member
    static let b = this.j() // EXPECTED: regex 'this' is not allowed to initialize static member
}

func main(){
    return 1
}
