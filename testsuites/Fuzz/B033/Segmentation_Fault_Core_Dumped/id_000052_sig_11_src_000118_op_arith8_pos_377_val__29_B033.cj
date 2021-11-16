// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait Num {
    func chooseOne(a: This, b: Int32): Int32
}

append Int32*String with Num{
    func chooseOne(a: Int32*String , b: Int32): Int32 {
        return b
    }
}

func run(): Int64 {
    var a:Int32*String = (3, "t")
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


