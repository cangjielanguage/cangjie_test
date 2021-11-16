// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64{
    var a : Int64 = -1
    var myArray = Array<Int32>(a,0)
    var myArray2 = Array<Int32>(-1,0)
    return 0
}
