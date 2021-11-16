// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Num<V1,V2,V3> where V1<:Color,V2<:Weather,V3<:Weather {
    func chooseOne(a: This, b: V1,c:V2,d:V3): V1
}
trait Color {
    func addColor(a: This, b: Int32): This
}
trait Weather {
    func showWeather(a: This, b: Int32): This
}

record Student {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student with Num<U1,U2,U3> where U1<:Color ,U2<:Weather ,U3<:Weather{ 
    func chooseOne(a: Student, b:U1, c:U2, d:U3): U1 { return b} 
}


append Int16 with Color {
    func addColor(a: Int16, b: Int32): Int16{
        return a
    }
}

append Int32 with Weather {
    func showWeather(a: Int32, b: Int32): Int32{
        return a
    }
}

func run(): Int64 {
    var v1: Student = Student(1)
    var v2: Int8 = 2
    var v3: Int16 = 3
    var v4: Int32 = 4
    let x: Int16 = chooseOne(v1,v3,v4,v4)
    if (x == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


