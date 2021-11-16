// DEPRECATED TRAIT!


trait Num {
    func chooseOne(a: This, b: This): Int32
}

record Student<K1,K2,K3>{
    var t1: K1
    var t2: K2
    var t3: K3
    var t4: Int32
    init(x:K1,y:K2,z:K3,v:Int32){
        t1 = x
        t2 = y
        t3 = z
        t4 = v
ord }
}


trait Color {
    func addColor(a: This, b: Int32 ): This
}
trait Weather {
    func showWeather(a: This, b: Int32 ): This
}

append<U1,U2,U3> Student<U1,U2,U3> with Num  where U1<:Color , U2<:Weather , U3<:Num{
    func chooseOne(a: Student<U1,U2,U3>, b: Student<U1,U2,U3>): Int32 {
        return a.t4 + b.t4
    }
}
append Int8 with Color{
    func addColor(a: Int8, b: Int32 ): Int8{
        return a
    }
}
append Int16 with Weather{
    func showWeather(a: Int16, b: Int32 ): Int16{
        return a
    }
}

append Int32 with Num{
    func chooseOne(a: Int32, b: Int32 ): Int32{
        return a
    }
}


func run(): Int64 {
    var i: Int8 = 1
    var j: Int16 = 2
    var k: Int32 = 3
    var a: Student<Int8,Int16,Int32> = Student<Int8,Int16,Int32>(i,j,k,10)
    var b: Student<Int8,Int16,Int32> = Student<Int8,Int16,Int32>(i,j,k,20)
    let x: Int32  = chooseOne(a,b)
    if ( x == 30 && a.t1 == 1 && b.t2 == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


