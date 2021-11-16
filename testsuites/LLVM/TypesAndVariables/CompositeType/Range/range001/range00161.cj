// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = (1,1)[1]..(10,10)[0]:(1,1)[1]
    //let a = (1,1)..(2,2):(1,1)
    return 0
}
