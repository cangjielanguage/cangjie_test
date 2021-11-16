// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class B{
    let i = 1
    static let a = i // EXPECTED: regex 'i' is non-static member, cannot be accessed by static variable
}

abstract class C{
    let i = 1
    static let a = i // EXPECTED: regex 'i' is non-static member, cannot be accessed by static variable
}

func main(){
    return 1
}