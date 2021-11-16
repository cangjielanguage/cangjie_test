// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append Int32 with Num {
    func plus(a: Int32, b: Int32):Int32 { return 10 }
}

append Array<Int32> with Num {
    func plus(a: Array<Int32>, b: Array<Int32>):Int32 { return 11 }
}

append Array<Array<Int32>> with Num {
    func plus(a: Array<Array<Int32>>, b: Array<Array<Int32>>):Int32 { return 12 }
}


func run(): Int64 {
    let x: Int32  = plus(1,2)
    let y: Int32  = plus(@{1,2},@{3,4})
    let z: Int32  = plus(@{@{1,2},@{2,1}},@{@{3,4},@{4,3}})
    if ( x==10 && y == 11  && z == 12) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}