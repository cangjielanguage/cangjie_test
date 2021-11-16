// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Set<Int32> = #{1}
    let myArray : Set<Int32>[] = @{a,#{1}}
    let youArray : Set<Int32>[] = @{a,#{0}}
    return 0
}
