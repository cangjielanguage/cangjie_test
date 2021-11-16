// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


trait Num {
    func chooseOne(a: This, b: Int32 ): This
}

record Student<K1,K2,K3> {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student<U1,U2,U3> with Num { 
    func chooseOne(a: Student<U1,U2,U3>, b:Int32): Student<U1,U2,U3> { return a}
}


func run(): Int64 {
    var v1: Student<Int8,Int16,Int32> = Student<Int8,Int16,Int32>(1)
    var v2: Int8 = 1
    var v3: Int16 = 2
    var v4 : Int32 = 3
    let x: Student<Int8,Int16,Int32>  = chooseOne(v1,3)
    if=( x.s == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


