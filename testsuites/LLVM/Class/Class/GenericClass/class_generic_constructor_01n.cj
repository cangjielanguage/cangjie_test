// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data<T>  {
    var f: T     // EXPECTED: regex the uninitialized member variable 'f' is not initialized in the constructor of class or record
}


func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>()
    var res: Int64 = data.f
    return 0
}

func main(): Int64 {
    return run()
}
