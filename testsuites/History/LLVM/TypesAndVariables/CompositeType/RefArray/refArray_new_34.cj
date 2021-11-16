// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1: Int32 = 2147483647
var a2: Int32 = 2147483647

var a = RefArray<Int32>(1, @overflowWrapping{i => a1+a2}) 

func main(): Int64 {
    
    return Int64(a[0]+2)
}
