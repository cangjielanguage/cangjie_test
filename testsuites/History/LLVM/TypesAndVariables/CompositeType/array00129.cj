// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Map<Int32, Int32> = #{1:1}
    let myArray : Map<Int32, Int32>[] = @{a,#{1:1}}
    let youArray : Map<Int32, Int32>[] = @{a,#{1:0}}
    return 0
}
