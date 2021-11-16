// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int16 = 32767
    var aa : Int16 = 0
    var b : Float64 = Float64(a)
    var bb : Float64 = Float64(aa)
    var c : Float64 = 32767.0
    var cc : Float64 = 0.0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
