// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Array<Float64>>([Array<Float64>([1.00,2.00,3.00])])
var a2 = Array<Array<Float64>>([Array<Float64>([1.01,2.00,3.00])])


func main(): Int64 {
    if(a1!=a2){
        return 0
    }
    return 1
}
