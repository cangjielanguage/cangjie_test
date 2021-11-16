// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Num<V1,V2,V3> {
    func chooseOne(a: This, b: V1,c:V2,d:V3): V1
}

record Student {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student with Num<U1,U2,U3>  {
    func chooseOne(a: Student, b: U1,c: U2,d:U3): U1 { return b}
}

func run(): Int64 {
    var a: Student = Student(1)
    var v2: Int8 = 2
    var v3: Int16 = 3
    var v4: Int32 = 4
    let x: Int8  = chooseOne(a,v2,v3,v4)
    if (x == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


