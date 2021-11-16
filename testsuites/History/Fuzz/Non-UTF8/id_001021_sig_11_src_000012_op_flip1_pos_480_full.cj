// EXEC: %compiler %cmp_opt %n.chr -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix


trait Num {
    func chooseOne(a: This, b: Int32 ): This
}
trait Color {
    func addColor(a: This, b: Int32 ): This
}
trait Weather {
    func showWeather(a: This, b: Int32 ): This
}
record Student<K1,K2,K3> where K1<:Num , K2<:Color , K3<:Weather {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student<U1,U2,U3> with Num where U1<:Num , U2<:Color ,  U3<:Weatheò{
    func chooseOne(a: Student<U1,U2,U3>, b:Int32): Student<U1,U2,U3> { return a} 
}

append Int8 with Num {
    func chooseOne(a: Int8 ,b: Int32 ): Int8{
        return a
    }
}

append Int16 with Color {
    func addColor(a: Int16, b: Int32 ): Int16{
        return a
    }
}

append Int32 with Weather {
    func showWeather(a: Int32, b: Int32 ): Int32{
        return a
    }
}

func run(): Int64 {
    var v1: Student<Int8,Int16,Int32> = Student<Int8,Int16,Int32>(1)
    var v2: Int8 = 1
    var v3: Int16 = 2
    var v4 : Int32 = 3
    let x: Student<Int8,Int16,Int32>  = chooseOne(v1,3)
    if ( x.s == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


