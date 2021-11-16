// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func g<T>(a:T){}
func main(){
    var a :Int32 = 0
    g<Int32>(a)
    return 0
}