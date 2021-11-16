// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

var m:Int32 = 0


func run(): Int64 {
    var x:Int32 = 10
    var y = 10
    var a1:Int32->Int32 = foo1 // EXPECTED: regex type before arrow of function type should be embraced by a pair of parentheses
    var a2:()->Int32 = foo2
    var a3:()->Unit = foo3
    var a4:(Unit->Unit = foo4 // EXPECTED: regex type before arrow of function type should be embraced by a pair of parentheses
    var a5:(()->Unit)->()->Unit = foo5
    var a6:((()->Unit)->()->Unit)->(()->Unit)->()->Unit = foo6
    var a7:()->Unit = foo7
    var a8:(()->Unit)->()->Unit  = foo8
    var a9:(Int32*Int32)->Unit  = foo9 // EXPECTED: regex initializer's type is incompatible with variable declaration 'a9'
    var a10:(Int32,Int32)->Unit  = foo9

    if (a1(x) != 10) {
        return 1
    }
    if (a2() != 10) {
        return 1
    }
    a3()
    if (m != 1) {
        return 1
    }
    a4(a3())
    if (m != 2) {
        return 1
    }
    a5(a3)()
    if (m != 3) {
        return 1
    }
    a6(a5)(a3)()
    if (m != 4) {
        return 1
    }
    a7()
    if (m != 5) {
        return 1
    }
    a8(foo3)()
    if (m != 6) {
        return 1
    }
    return 0
}

func foo9(a:Int32,b:Int32):Unit{
    m = a + b
}
func foo8(a:()->Unit=foo3):()->Unit{
    return a
}
func foo7(){
    m = m + 1
}
func foo6(a:(()->Unit)->()->Unit):(()->Unit)->()->Unit{
    return a
}
func foo5(a:()->Unit):()->Unit{
    return a
}
func foo4(a:Unit):Unit{
    return a
}
func foo3():Unit{
    m = m + 1
}
func foo2():Int32{
    return 10
}
func foo1(a:Int32):Int32{
    return a
}

