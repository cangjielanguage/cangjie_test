// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b: Int32): Int32
}

record Student<K>{
    let t: K 
    init(x:K){
        t = x
    }

}

append Student<Int32> with Num{
    func chooseOne(a: Student<Int32>, b: Int32): Int32 {
        return b
    }
}

func run(): Int64 {
    var a: Student<Int32> = Student<Int32>(1)
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


