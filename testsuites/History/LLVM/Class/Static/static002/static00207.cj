// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A{
    func i(){}
    let a = i() // EXPECTED: regex 'i' is non-static member, cannot be accessed by static variable

}

class B{
    func i(){}
    static let a = i() // EXPECTED: regex 'i' is non-static member, cannot be accessed by static variable
}

abstract class C{
    func i(){}
    func j():Unit
    static let a = i() // EXPECTED: regex 'i' is non-static member, cannot be accessed by static variable
    static let b = j() // EXPECTED: regex 'j' is non-static member, cannot be accessed by static variable
}

func main(){
    return 1
}