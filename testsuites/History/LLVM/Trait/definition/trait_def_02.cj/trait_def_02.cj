// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func plus(a: Int32,b:Int32): Int64 {3}

trait Num {
    func plus(a:Int32,b:Int64):Int32
}
append Int32 with Num {
    func plus(a: Int32,b:Int64): Int32 { 9 }
}

trait Color{
    func plus(a:This,b: Int32): This
}
append Int32 with Color{
    func plus(a: Int32,b:Int32): Int32 { 16 }
}


func run():Int64{
    var x:Int32 = 1
    var y:Int64 = 1
    var r1 = plus(1,2)  // 调用9,plus(a: Int32,b:Int64): Int32 {9 }
    var r2: Int32 = plus(1,2) // 调用9,plus(a: Int32,b:Int64): Int32 {9 }
    var r3: Int64 = plus(1,2) // 调用3,plus(a: Int32,b:Int32): Int64 {3}
    var r4 = plus(x,x) // 调用3,plus(a: Int32,b:Int32): Int64 {3}
    var r5: Int32 = plus(x,x) // 调用16, plus(a: Int32,b:Int32): Int32 {16 }
    var r6 = plus(x,y) // 调用9,plus(a: Int32,b:Int64): Int32 {9 }
    if (r1 != 9) { return 1 }
    if (r2 != 9) { return 1 }
    if (r3 != 3) { return 1 }
    if (r4 != 3) { return 1 }
    if (r5 != 16) { return 1 }
    if (r6 != 9) { return 1 }
    return 0
}


func main(): Int64 {
    return run()
}



