// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64{
    let a = Array<Int32>(try {5} catch(_){1},5)
    return 0
}
