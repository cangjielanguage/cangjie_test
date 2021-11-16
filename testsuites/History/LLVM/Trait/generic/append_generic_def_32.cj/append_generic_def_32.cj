// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b: This): This
}

record Student<K1,K2,K3,K4,K5,K6,K7,K8,K9,K10,K11,K12,K13,K14,K15,K16,K17,K18,K19,K20>{
    var t1: K1
    var t2: K2
    var t3: K3
    var t4: K4
    var t5: K5
    var t6: K6
    var t7: K7
    var t8: K8
    var t9: K9
    var t10: K10
    var t11: K11
    var t12: K12
    var t13: K13
    var t14: K14
    var t15: K15
    var t16: K16
    var t17: K17
    var t18: K18
    var t19: K19
    var t20: K20
    init(x1:K1,x2:K2,x3:K3,x4:K4,x5:K5,x6:K6,x7:K7,x8:K8,x9:K9,x10:K10,x11:K11,x12:K12,x13:K13,x14:K14,x15:K15,x16:K16,x17:K17,x18:K18,x19:K19,x20:K20){
        t1 = x1
        t2 = x2
        t3 = x3
        t4 = x4
        t5 = x5
        t6 = x6
        t7 = x7
        t8 = x8
        t9 = x9
        t10 = x10
        t11 = x11
        t12 = x12
        t13 = x13
        t14 = x14
        t15 = x15
        t16 = x16
        t17 = x17
        t18 = x18
        t19 = x19
        t20 = x20
    }
}


trait Color {
    func addColor(a: This, b: Int32): This
}
trait Weather {
    func showWeather(a: This, b: Int32): This
}

append<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20> Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20> with Num  where U1<:Color , U2<:Weather , U3<:Num , U4<:Num , U5<:Num , U6<:Num , U7<:Num , U8<:Num , U9<:Num , U10<:Num , U11<:Num , U12<:Num , U13<:Num , U14<:Num , U15<:Num , U16<:Num , U17<:Num , U18<:Num , U19<:Num , U20<:Num {
    func chooseOne(a: Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20>, b: Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20>): Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20> {
        return a
    }
}
append Int8 with Color{
    func addColor(a: Int8, b: Int32): Int8{
        return a
    }
}
append Int16 with Weather{
    func showWeather(a: Int16, b: Int32): Int16{
        return a
    }
}

append Int32 with Num{
    func chooseOne(a: Int32, b: Int32): Int32{
        return a
    }
}

func run(): Int64 {
    var i: Int8 = 1
    var j: Int16 = 2
    var k: Int32 = 3
    var a: Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32> = Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32>(i,j,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k)
    var b: Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32> = Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32>(i,j,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k)
    let x: Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32> = chooseOne(a,b)
    if (x.t1 == 1 && a.t2 == 2 && b.t3 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


