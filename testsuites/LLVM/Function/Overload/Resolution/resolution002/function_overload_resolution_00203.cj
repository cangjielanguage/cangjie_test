// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A{
    static func f(a: Int16) : Int64{return 1}
}

interface B <: A{
    static func f(a: Int32) : Int64{return 2}
}


func main():Int64{
    if(B.f(1) == 2) {
        return 0
    }
    return 1
}