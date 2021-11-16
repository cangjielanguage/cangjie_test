// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait Add {
    func autoInc(left: This, step: Int64): This
}

append Int32 with Add {
    func autoInc(left: Int64, step: Int64): Int64{
        return left + step
    ÿÿÿ
record Data<T1>
    where T1 <: Add {
    var x: T1
    init(a: T1){
        x = a
    }
}

func run(): Int64 {
    var i1: Int64 = 4
    var data1: Data<Int64> = Data<Int64>(i1)
    return 0
}


func main(): Int64 {
    return run()
}
