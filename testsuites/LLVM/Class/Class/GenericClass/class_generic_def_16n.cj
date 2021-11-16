// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data<T>
    where T <:  {  // EXPECTED: regex expected type
    var x: T
    init(a: T){
        x = a
    }
}

func main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    return 0
}