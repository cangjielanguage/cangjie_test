// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a = Array<Int32>(1,1)
    try{
    	let b = a[1]
    } catch(_){
    	return 0
    }
    
    return 1
}
