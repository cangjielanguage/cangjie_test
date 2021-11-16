// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data<T>  {
    var f: T
}


func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)  // EXPECTED: regex no matching constructor for call
    return 0
}

func main(): Int64 {
    return run()
}
