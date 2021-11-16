// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

var m:Int32 = 0


func run(): Int64 {
    var x:Int32 = 10
    var y = 10

    if (1.foo1(x) != 10) {
        return 1
    }
    if (1.foo2() != 10) {
        return 1
    }
    1.foo3()
    if (m != 1) {
        return 1
    }
    1.foo4(1.foo3())
    if (m != 2) {
        return 1
    }
//   1.foo5(1.foo3)()
//   if (m != 3) {
//       return 1
//   }
//   1.foo6(1.foo5)(1.foo3)()
//   if (m != 4) {
//       return 1
//   }
    1.foo7()
    if (m != 3) {
        return 1
    }
//   1.foo8(1.foo3)()
//   if (m != 6) {
//       return 1
//   }
    return 0
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

append Int64 with TR {
    func foo8(x:Int64,a:(Int64)->Unit):(Int64)->Unit{
        return a
    }
    func foo7(x:Int64){
        m = m + 1
    }
    func foo6(x:Int64,a:((Int64)->Unit)->(Int64)->Unit):((Int64)->Unit)->(Int64)->Unit{
        return a
    }
    func foo5(x:Int64,a:(Int64)->Unit):(Int64)->Unit{
        return a
    }
    func foo4(x:Int64,a:Unit):Unit{
        return a
    }
    func foo3(x:Int64):Unit{
        m = m + 1
    }
    func foo2(x:Int64):Int32{
        return 10
    }
    func foo1(x:Int64,a:Int32):Int32{
        return a
    }
}