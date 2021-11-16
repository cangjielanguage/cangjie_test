// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A<T>{}

extend A<T> where T <: ?Int64{
    func test(){0}
}

func main(): Int64 {
    var a : A<Int64> = A<Int64>()
    a.test() // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}