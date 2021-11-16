// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex error
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a1: Int32 = 2  // Int32 2
var a2: Float32 = 2.0 // Float32 2.0
var a3: Float32 = 2 // Float32 2.0
var a4 = 2 // Int64 2
var a5 = 2.0 // falot64 2.0

func plus(b:Int32,a: Int32): Int64 { 1 } // (Int32,Int32)->Int64
func plus(b:Int32,a: Int64): int6* { 2 } // (Int32,Int64)->Int64
func plus(b:Float32,a: Int64): Int64 { 3 } // (Float32,Int64)->Int64
func plus(b:Float64,a: Int64): Int64 { 4 } // (Float64,Int64)->Int64

trait TR1 {
    func plus(a:This,b:Int64):Int64
}
append Int32 with TR1 {
    func plus(a: Int32,b:Int64): Int64 { 11 }  // (Int32,Int64)->Int64
}
append Float32 with TR1 {
    func plus(a: Float32,b:Int64): Int64 { 12 } // (Float32,Int64)->Int64
}

trait TR2{
    func plus(a:This,b: Int32): This
}
append Int32 with TR2{
    func plus(a: Int32,b:Int32): Int32 { 21 } // (Int32,Int32)->Int32
}
append Float32 with TR2{
    func plus(a: Float32,b:Int32): Float32 { 22 } // (Float32,Int32)->Float32
}
append Float64 with TR2{
    func plus(a: Float64,b:Int32): Float64 { 23 } // (Float64,Int32)->Float64
}

//trait TR3 {
//    func plus(a:This,b:Int64):Int32
//}
//append Int32 with TR3 {
//    func plus(a: Int32,b:Int64): Int32 { 31 } // (Int32,Int64)->Int32
//}
//append Float32 with TR3 {
//    func plus(a: Float32,b:Int64): Int32 { 32 }
//}

func run():Int64{
    var x:Int32 = 1
    var y:Int64 = 1
    var z:Float32 = 1
    var r1 = plus(a1,a4) // 全局和traitFunc同参同返回，进行决议，而int32<:This，那全局更specific
    var r2 = plus(x,y)
    var s1:Int64 = plus(a1,a4)
    if r1 != r2 || r1!= 2 || s1 != 2 { return 1}
    var r3 = plus(a1,a1) // 全局和traitFunc同参，不同返回，但是没有限定返回类型，他们进行决议，而int32<:This，那全局更specific
    var r4 = plus(x,x)
    var s3:Int32 = plus(a1,a1)
    var s4:Int64 = plus(a1,a1)
    a1 = plus(a1,a1)
    if r3 != r4 || r3!= 1 || s3 != 21 || s4 != 1 || a1 != 21 { return 1 }
    var u:Float32 = 1.0
    var v:Float64 = 1.0
    var r11 = plus(a3,a4)
    var r12 = plus(a3,a1)
    if r11 != 3 || r12 != 22 { return 1 }
    var r13 = plus(a5,a4)
    if r13 != 4  { return 1 }
//    print(r13.toString()+"\n")
//    print(r13.toString()+"\n")
    return 0
}

func main(): Int64 {
    return run()
}
