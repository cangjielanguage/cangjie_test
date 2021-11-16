// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

trait Add {
    func autoInc(left: This, step: Int64): This
}


record Data<T1>
    where T1 <: Add {
    var x: T1
    init(a: T1){
        x = a
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data: Data<Int64> = Data<Int64>(i1)  // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}


func main(): Int64 {
    return run()
}
