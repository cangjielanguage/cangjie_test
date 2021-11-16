// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float64 = -2.1
    var aa : Float64 = 2.1
    var b : Int16 = Int16(a)
    var bb : Int16 = Int16(aa)
    var c : Int16 = -2
    var cc : Int16 = 2

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
