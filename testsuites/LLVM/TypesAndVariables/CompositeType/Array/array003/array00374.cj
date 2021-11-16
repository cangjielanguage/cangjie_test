// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    let a = Array<Array<Int32>>(5,Array<Int32>(5,5))
    return 0
}
