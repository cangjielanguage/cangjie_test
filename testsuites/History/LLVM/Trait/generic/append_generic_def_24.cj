// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b: Int32): Int32
}

append<U1,U2> Map<U1,U2> with Num{
    func chooseOne(a: Map<U1,U2>, b: Int32): Int32 {
        return b
    }
}

func run(): Int64 {
    var a:Map<T,V> = #{1 : "Aa", 2 : "Bb", 3 : "Cc", 1 : "fir"} 
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


