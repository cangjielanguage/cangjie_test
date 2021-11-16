// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main(): Int64 {
    return run();
}

record Data {
    static func foo1():Int32{ return 1}
    var a0:Int32 = 1
    var a1: Int32 = foo1()
    var a2: Int32 = foo2()
    let a3: Int32 =a0
    static var a4: Int32 = 2
    static var a5: Int32 = a3 // EXPECTED: regex 'a3' is non-static member, cannot be accessed by static variable
    static func foo2():Int32{ return a4}
    static func foo3():Int32{ return a3} // EXPECTED: regex  'a3' is non-static member, cannot be accessed by static function 'foo3'
    func foo4():Int32{ return a4}
    var x: Int32 = 1
    var y: Int32 = 1
}

func run(): Int64 {
    var a0:Int32 = 1;var A0:Int32 = 2
    var a: Data = Data()
    var b: Data = a
    var c = b.a1
    var d = Data.foo2()
    if (c != 1 || d != 3) {return 1}
    return 0
}