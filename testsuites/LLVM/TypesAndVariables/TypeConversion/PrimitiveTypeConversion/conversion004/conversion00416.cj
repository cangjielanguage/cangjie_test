// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt64 = 9223372036854775807
    var aa : UInt64 = 0
    var b : Int64 = Int64(a)
    var bb : Int64 = Int64(aa)
    var c : Int64 = 9223372036854775807
    var cc : Int64 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
