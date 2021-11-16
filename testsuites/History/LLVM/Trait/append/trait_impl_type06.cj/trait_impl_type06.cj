// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append Map<Int32,String> with Num {
    func plus(a: Map<Int32,String>, b: Map<Int32,String>):Int32 { return 10 }
}

func run(): Int64 {
    var a:Map<Int32,String> = #{1 : "Aa", 2 : "Bb", 3 : "Cc", 1 : "fir"}
    var b:Map<Int32,String> = #{1 : "Aa", 2 : "Bb", 3 : "Cc", 1 : "fir"}
    let x: Int32  = plus(a,b)
    if (x==10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}