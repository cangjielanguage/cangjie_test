// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b:Int32): Int32
}

record Student<K1,K2,K3> {
    var s: Int32
    init(x: Int32){
       s = x
    }
}

append<X1,X2,X3> Student<X1,X2,X3>  with Num{  
    func chooseOne(a: Student<X1,X2,X3>, b: Int32):  Int32 { return b}
}
append<Y1,Y2,Y3> Student<Y2,Y3,Y1>  with Num { 
    func chooseOne(a: Student<Y2,Y3,Y1>, b: Int32):  Int32 { return b * 2 }
}

func run(): Int64 {
    var a: Student<Int32,Int32,Int32> = Student<Int32,Int32,Int32>(1)
    var v2: Int8 = 2
    var v3: Int16 = 3
    var v4: Int32 = 4
    let x: Int32  = chooseOne(a,v4)
    if (x == 8) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


