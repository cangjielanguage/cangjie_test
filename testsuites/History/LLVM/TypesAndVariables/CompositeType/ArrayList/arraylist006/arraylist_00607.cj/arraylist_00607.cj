// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X<T>{
    func test(a:This,b:T):T
}

append<T> Int8 with X<T> where T <: ArrayList<Unit>{
    func test(a:Int8,b:T):T{b}
}

func main(): Int64 {
    var res = test(Int8(1),ArrayList<Unit>(10))
    return res.size()
}