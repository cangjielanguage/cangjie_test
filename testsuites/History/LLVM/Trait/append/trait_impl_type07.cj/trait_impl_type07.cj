// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append  Int32*String  with Num {
    func plus(a: Int32*String, b: Int32*String):Int32 { return a[0] + b[0] }
}

func run(): Int64 {
    var a:Int32*String = (3, "t")
    var b:Int32*String = (5, "r")
    let x: Int32  = plus(a,b)
    if (x == 8) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
