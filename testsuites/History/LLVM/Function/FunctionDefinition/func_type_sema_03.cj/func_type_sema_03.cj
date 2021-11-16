// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

var m:Int32 = 0


func run(): Int64 {
    var x:Int32 = 10
    var y = 10
    var a:()->Int32={  => 3}

    if (a.foo1(x) != 10) {
        return 1
    }
    if (a.foo2() != 10) {
        return 1
    }
    a.foo3()
    if (m != 1) {
        return 1
    }
    a.foo4(a.foo3())
    if (m != 2) {
        return 1
    }
   a.foo5(foo3)(a)
   if (m != 3) {
       return 1
   }
   a.foo6(foo5)(foo3)(a)
   if (m != 4) {
       return 1
   }
    a.foo7()
    if (m != 5) {
        return 1
    }
   a.foo8(foo3)(a)
   if (m != 6) {
       return 1
   }
    return 0
}

func foo3(x:()->Int32):Unit{
    m = m + 1
}
func foo5(a:(()->Int32)->Unit):(()->Int32)->Unit{
    return a
}
trait TR{
    //func foo8(x:This,a:(This)->Unit=foo3):(This)->Unit
    func foo8(x:This,a:(This)->Unit):(This)->Unit
    func foo7(x:This):Unit
    func foo6(x:This,a:((This)->Unit)->(This)->Unit):((This)->Unit)->(This)->Unit
    func foo5(x:This,a:(This)->Unit):(This)->Unit
    func foo4(x:This,a:Unit):Unit
    func foo3(x:This):Unit
    func foo2(x:This):Int32
    func foo1(x:This,a:Int32):Int32
}

append ()->Int32 with TR {
    func foo8(x:()->Int32,a:(()->Int32)->Unit):(()->Int32)->Unit{
        return a
    }
    func foo7(x:()->Int32){
        m = m + 1
    }
    func foo6(x:()->Int32,a:((()->Int32)->Unit)->(()->Int32)->Unit):((()->Int32)->Unit)->(()->Int32)->Unit{
        return a
    }
    func foo5(x:()->Int32,a:(()->Int32)->Unit):(()->Int32)->Unit{
        return a
    }
    func foo4(x:()->Int32,a:Unit):Unit{
        return a
    }
    func foo3(x:()->Int32):Unit{
        m = m + 1
    }
    func foo2(x:()->Int32):Int32{
        return 10
    }
    func foo1(x:()->Int32,a:Int32):Int32{
        return a
    }
}