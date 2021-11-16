// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b: This): This
}

record Student<K>{
    let t: K 
    init(x:K){
        t = x
    }

}

append<U> Student<U> with Num{
    func chooseOne(a: Student<U>, b: Student<U>): Student<U> { 
        return b
    }
}

func run(): Int64 {
    var a: Student<Int32> = Student<Int32>(1)
    var b: Student<Int32> = Student<Int32>(2)
    let x: Student<Int32>  = chooseOne(a,b)
    if (x.t == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


