// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = -3.4*10.0**38.0
    var aa : Float32 = -1.18*10.0**-38.0
    var aaa : Float32 = 1.18*10.0**-38.0
    var aaaa : Float32 = 3.4*10.0**38.0
    var b : Float32 = Float32(a)
    var bb : Float32 = Float32(aa)
    var bbb : Float32 = Float32(aaa)
    var bbbb : Float32 = Float32(aaaa)
    var c : Float32 = -3.4*10.0**38.0
    var cc : Float32 = -1.18*10.0**-38.0
    var ccc : Float32 = 1.18*10.0**-38.0
    var cccc : Float32 = 3.4*10.0**38.0

    if (b == c && bb == cc && bbb == ccc && bbbb == cccc) {
        return 0
    }
    return 1
}
