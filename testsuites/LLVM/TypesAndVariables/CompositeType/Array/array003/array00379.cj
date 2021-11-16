// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(){
    let a = Array<Int32>(5,try{5}catch(_){5})
    return 0
}
