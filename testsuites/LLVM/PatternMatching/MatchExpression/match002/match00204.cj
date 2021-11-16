// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let a:Array<Int32> = @{0}
    match (a[0]) {
        case _ => "0"
    }
    return 0
}

func main(): Int64 {
    return test()
}
