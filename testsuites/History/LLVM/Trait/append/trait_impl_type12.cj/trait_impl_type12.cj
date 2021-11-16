// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append Data with Num {
    func plus(a: Data, b: Data):Int32 { return a.a+b.a }
}

class Data {
    var a:Int32
    init(x:Int32){
        a = x
    }
}

func run(): Int64 {
    var a:Data = Data(1)
    var b:Data = Data(2)
    let x: Int32  = plus(a,b)
    if (x==3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}