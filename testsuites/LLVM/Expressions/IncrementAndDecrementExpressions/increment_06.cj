// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// TOP函数返回自增减
func main(): Int64 {
    if (run() == ()) {
        return 0
    }
    return 1
}


func run(): Unit {
    var i:Int64 = 2
    var j:Int32 =  0
    return i--
}