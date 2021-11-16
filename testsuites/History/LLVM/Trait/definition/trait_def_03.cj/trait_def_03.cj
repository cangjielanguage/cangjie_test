// EXEC: %compiler %cmp_opt %n.cj -o %output  2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait TR1 {
    func plus(a:This,b:Int64):Int64
}
append Int32 with TR1 {
    func plus(a: Int32,b:Int64): Int64 { 11 }
}

trait TR2{
    func plus(a:This,b: Int32): This
}
append Int32 with TR2{
    func plus(a: Int32,b:Int32): Int32 { 21 }
}

trait TR3 {
    func plus(a:This,b:Int64):Int32
}
append Int32 with TR3 {
    func plus(a: Int32,b:Int64): Int32 { 31 }
}


func run():Int64{
    // 没有指明返回类型，TR1和TR3无法决议
    var r1 = plus(1,2) // EXPECTED: regex error.*?ambiguous match for function call
    return 0
}


func main(): Int64 {
    return run()
}



