// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var a : (Int64)->?Int64 = {x:Int64=>return x}

func main(): Int64 {
    return 0
}
