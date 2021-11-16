// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class B{
    let i = 1
    static let a = this.i // EXPECTED: regex 'this' is not allowed to initialize static member
}

abstract class C{
    let i = 1
    static let a = this.i // EXPECTED: regex 'this' is not allowed to initialize static member
}

func main(){
    return 0
}