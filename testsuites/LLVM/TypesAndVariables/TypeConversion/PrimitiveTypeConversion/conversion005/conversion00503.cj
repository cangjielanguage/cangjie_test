// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int16 = 32767
    var aa : Int16 = 0
    var b : Float32 = Float32(a)
    var bb : Float32 = Float32(aa)
    var c : Float32 = 32767.0
    var cc : Float32 = 0.0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
