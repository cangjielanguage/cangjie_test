// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int64>([1,2,3])
var a2 = Array<Int64>([1,5,3])


func main(): Int64 {
    if(a1 == a2){
        return 1
    }
    return 0
}
