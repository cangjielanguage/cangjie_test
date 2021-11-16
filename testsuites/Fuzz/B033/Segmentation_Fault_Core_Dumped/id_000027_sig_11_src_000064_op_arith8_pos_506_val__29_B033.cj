// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


trait Num<V> {
    func chooseOne(a: This, b: V ): This
}

record Student<K1,K2> {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student<U1,U2> with Num<U3> {
    func chooseOne(a: Student<U1,U2>, b:U3): Student<U1,U2> { return a}
}


func run(): Int64 {
    var v1: Student<Int8,Int16> = Student<Int8,Int16>(1)
    var v2: Int8 = 1
    let x: Student<Int8,Int16>  = chooseOne(v1,v2)
    if=( x.s == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


