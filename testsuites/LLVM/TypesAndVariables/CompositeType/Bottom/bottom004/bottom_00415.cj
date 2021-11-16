// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let a : ()->Int64 = {  => return return 0}

func main(): Int64 {
    let b : ()->Int64 = {  => return return 0}
    return a() + b()
}
