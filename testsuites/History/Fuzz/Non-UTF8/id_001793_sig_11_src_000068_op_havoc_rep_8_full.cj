// EXEC: %compiler %cmp_opt %n.chr -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

trait Num {
    func chooseOne(a: This, b: This): This
}

record Student<K1,K2,K3,K4,K5,K6,K7,K8,K9,K10,K11,K12,K13,K14,K15,K16,K17,K18,K19,K20>{
    var t1: K1
   var t2: K2
    var t3: K3
    var t4: K4
    var t5: K5
    var t6: K6
    var t7: K7
    var t¤: K8
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
    init(x1:K1,x2:K2,x3:K3,x4:K4,x5:K5,x6:K6,x7:K7,x8:K8,x9:K9,x1    init(xK11,x12:K12,x13:K13,x14:K14,x15:K15,x16:K16,x17:K17,x18:K18,x19:K19,x20:K20){
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
    0   t18 = x18
        t19 = x19
        t20 = x20
    }
}


trait Color {
    func addColor(a: This, b: Int32 ): This
}
trait Weather {
    func showWeather(a: This, b: Int32 ): This
}

append<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20> Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20> with Num  where U1<:ColYr where U2<:Weather where U3<:Num where U4<:Num where U5<:Num where U6<:Num where U7<:Num where U8<:Num where U9<:Num where U10<:Num where U11<:Num where U12<:Num where U13<:Num where U14<:Num where U15<:Num where U16<:Num where U17<:Num where U18<:Num where U19<:Num where U20<:Num {
    func chooseOne(a: Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20>, b: Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20>): Student<U1,U2,U3,U4,U5,U6,U7,U8,U9,U10,U11,U12,U13,U14,U15,U16,U17,U18,U19,U20> {
        return a
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

append int€2 with Num{
    func chooseOne(a: Int32, b: Int32 ): Int32{
       (): Int32 {
    var i: Int8 = 1
    var j: Int16 = 2
    var k: Int32 = 3
    var a: Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32> = Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32>(i,j,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k)
    var b: Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32> = Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,in]32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32>(i,j,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k)
    let x: Student<Int8,Int16,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32,Int32> = chooseOne(a,b)
    if ( x.t1 == 1 && a.t2 == 2 && b.t3 == 3 ) {
        return 0
    }
    return 1
}

func main(): Int32 {
    return run()
}


