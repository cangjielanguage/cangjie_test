// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 初始值表达式中仅可以引用定义在它之前的成员变量，以及record中的静态成员函数
func main(): Int64 {
    return run();
}

record Data {
    static func foo1():Int32{ return 1}
    var a0:Int32 = 1
    static let a4: Int32 = 2
    var a1: Int32 = foo1() // 变量初值为其定义位置之前的静态函数
    var a2: Int32 = foo2() // 变量初值为其定义位置之后的静态函数
    var a3: Int32 =a0
    var a5: Int32 = 3
    static func foo2():Int32{ return foo1()+a4} // 静态函数中使用其他静态函数和静态let变量
    func foo3():Int32{ return foo1()+a5+a4} // 非静态函数中使用其他静态函数和静态let变量、非静态let变量
    static func foo5():Int32{ return foo6()}  // 同为静态函数，使用定义在其之后静态函数
    static func foo6():Int32{ return 1}
    var x: Int32 = 1
    var y: Int32 = 1
}

func run(): Int64 {
    var a0:Int32 = 1;var A0:Int32 = 2
    var a: Data = Data()
    var b: Data = a
    var c = b.a1
    var d = Data.foo2()
    var e = b.foo3()
    var f = Data.foo5()
    if (c != 1 || d != 3 || e != 6 || f != 1) {return 1}
    return 0
}
