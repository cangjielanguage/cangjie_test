// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    return run()
}

var m:Int32 = 0

func run(): Int64 {
    var x:Int32 = 10
    var y = 10
    var a8 :(Int32)->Int32= foo8
    if (a8() != 1) { // EXPECTED: regex missing argument for call with parameter list
        return 1
    }
    return 0
}

func foo8(a:Int32=1):Int32{
    return a
}
func foo3():Unit{
    m = m + 1
}
