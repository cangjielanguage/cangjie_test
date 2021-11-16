// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Day{}
class Monday <: Day{
    let m: Int32
    init(x: Int32){
        m = x
    }
} 

trait Color{
    func addPink(a:This,b:Int32):Int32
}

trait Weather{
    func addWeather(a:This,b:Int32):Int32
}

append Monday with Color{
    func addPink(a:Monday,b:Int32):Int32{
        return a.m+b
    }   
}
append Monday with Weather{
    func addWeather(a:Monday,b:Int32):Int32{
        return a.m+b+1
    }   
}

trait Num<V1> where V1<:Color , V1 <: Weather {
    func chooseOne(a: This, b: V1): V1
}

append<U1> Int32 with Num<U1>  where U1<:Color , U1 <: Weather {
    func chooseOne(a: Int32, b: U1): U1 { return b}
}

func run(): Int64 {
    var a: Int32 = 1
    var b: Monday = Monday(2)
    let x: Monday  = chooseOne(a,b)
    if (x.m + x.addPink(1) + x.addWeather(2) == 10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


