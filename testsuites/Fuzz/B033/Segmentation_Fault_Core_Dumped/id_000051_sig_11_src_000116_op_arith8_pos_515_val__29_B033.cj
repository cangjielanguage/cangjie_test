// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait Num {
    func chooseOne(a: This, b: Int32): Int32
}

append<U1> ListFloat64 with Num{
    func chooseOne(a: ListFloat64, b: Int32): Int32 {
        return b
    }
}

func run(): Int64 {
    var a: ListFloat64 = ListFloat64(2,10)
    var b: Int32 = 2
    let x: Int32  = chooseOne(a,b)
    if=( x == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


