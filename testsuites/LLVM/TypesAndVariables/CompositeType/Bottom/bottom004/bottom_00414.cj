// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let a = {  => return return 0}

func main(): Int64 {
    let b = {  => return return 0}
    return a() + b()
}
