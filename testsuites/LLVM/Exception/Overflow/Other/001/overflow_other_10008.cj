// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception
// ASSERT: scan overflow_other_10008.cj:7


var test = @overflowThrowing{  a:Int8,b:Int8 => return a*b }


func main(){
    return Int64(test(100,100))
}
