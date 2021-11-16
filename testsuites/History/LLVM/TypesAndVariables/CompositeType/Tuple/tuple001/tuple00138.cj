// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Set<Int32> = #{1}
    let myTuple : Set<Int32>*Set<Int32> = (a,#{1})
    return 0
}
