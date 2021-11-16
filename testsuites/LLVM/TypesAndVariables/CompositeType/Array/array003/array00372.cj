// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    let i : Int32 = 5
    let a = Array<Int32>(5,i)
    return 0
}
