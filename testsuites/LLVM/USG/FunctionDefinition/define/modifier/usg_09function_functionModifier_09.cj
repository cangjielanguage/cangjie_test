// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check the static modifier in interface
interface A{
    static func a(){}
}

func main(): Int64{
    return 0
}