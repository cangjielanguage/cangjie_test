// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Color{
    func addPink(a:This,b:Int32):Int32
}
class Monday {
    let m: Int32
    init(x: Int32){
        m = x
    }
} 

append Monday with Color{
    func addPink(a:Monday,b:Int32):Int32{
        return a.m+b
    }    
}

trait Num<V> where V<:Color {
    func chooseOne(a: This, b: V): V
}

append<U> Int32 with Num<U> where U<:Color {
    func chooseOne(a: Int32, b: U): U { return b }
}

func run(): Int64 {
    var a: Int32 = 1
    var b: Monday = Monday(2)
    let x: Monday  = chooseOne(a,b)
    if (x.m == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


