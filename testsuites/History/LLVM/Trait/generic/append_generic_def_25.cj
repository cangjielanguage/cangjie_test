// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b: Int32): Int32
}

append<U1> List<U1> with Num{
    func chooseOne(a: List<U1>, b: Int32): Int32 {
        return b
    }
}

func run(): Int64 {
    var a:List<Int32> //如何得到一个实例尚未实现
    var b: Int32 = 2
    let x: Int32  = chooseOne(a,b)
    if (x == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


