// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

trait Num {
    func chooseOne(a: This, b: Int32): Int32
}

append<U1> List<Int32> with Num{ // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition
    func chooseOne(a: List<Int32>, b: Int32): Int32 {
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


