// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    let a = Array<Option<Int32>>(5,None<Int32>)
    return 0
}
