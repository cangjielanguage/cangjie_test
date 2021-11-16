// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var a : ?Int64*?Int64*?Int64 = (Some(1),Some(1),Some(1))

func main(): Int64 {
    return 0
}
