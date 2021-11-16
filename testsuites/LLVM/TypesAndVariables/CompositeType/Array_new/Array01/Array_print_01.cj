// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = Array<Int64>([1,2,3])
    print("${a}")
    return 0
}