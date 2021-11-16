// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This,b:Int32): Int32
}

append<T> (Int32)->T with Num{
    func chooseOne(a: (Int32)->T, b: Int32): Int32 {
        return b + 1
    }
}



func run(): Int64 {
    var a: (Int32)->Int32 = { x:Int32 =>  return x}
    var b: Int32 = 2
    let x: Int32  = chooseOne(a,b)
    if (x == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


