// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


trait Num<V1,V2,V3> {
    func chooseOne(a: This, b: V1,c:V2,d:V3): V1
}

record Student<K> {
    var s: K
    init(x: K){
       s = x
    }
}

append<U1,U2,U3,U4> Student<U4> with Num<U1,U2,U3>  {
    func chooseOne(a: Student<U4>, b: U1,c: U2,d:U3): U1 { return b}
}

func run(): Int64 {
    var a: Student<Int32> = Student<Int32>(1)
    var v2: Int8 = 2
    var v3: Int16 = 3
    var v4: Int32 = 4
    let x: Int8  = chooseOne(a,v2,v3,v4)
    if=( x == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


