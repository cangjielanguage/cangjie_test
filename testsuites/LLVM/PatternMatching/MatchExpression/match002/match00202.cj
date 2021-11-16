// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    func myfunc(a:Int32):Int32{return a}
    match (myfunc(0)) {
        case 0 => "0"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
