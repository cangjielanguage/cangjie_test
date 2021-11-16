// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64{
    var test = { x:Int32 => match (x) {case _ => 1}}
    if (test(3) ==1) {
        return 0
    }
    return 1
}

