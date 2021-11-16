// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append Set<Int32> with Num {
    func plus(a: Set<Int32>, b: Set<Int32>):Int32 { return 10 }
}

func run(): Int64 {
    var a: Set<Int32> = #{5, 6, 7, 5} // b080 set尚未实现
    var b: Set<Int32> = #{6, 7, 5}
    let x: Int32  = plus(a,b)
    if (x==10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}