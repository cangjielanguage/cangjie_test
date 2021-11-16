// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data<T>
    where T <:  {  // EXPECTED: regex illegal upper bound
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