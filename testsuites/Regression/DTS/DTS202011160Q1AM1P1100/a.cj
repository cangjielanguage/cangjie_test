// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

var m:Int32 = 0
func run(): Int64 {
    var x:Int32 = 10
    var y = 10
    var a8 :(Int32)->Int32= foo8

if (foo8() != 1) {
    return 1
}
    return 0
}

func foo8(a!:Int32 = 1):Int32{
    return a
}
func foo3():Unit{
    m = m + 1
}
