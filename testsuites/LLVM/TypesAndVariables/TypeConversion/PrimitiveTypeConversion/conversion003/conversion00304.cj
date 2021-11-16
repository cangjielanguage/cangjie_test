// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float64 = -1.8*10.0**308.0
    var aa : Float64 = -2.23*10.0**-308.0
    var aaa : Float64 = 2.23*10.0**-308.0
    var aaaa : Float64 = 1.8*10.0**308.0
    var b : Float64 = Float64(a)
    var bb : Float64 = Float64(aa)
    var bbb : Float64 = Float64(aaa)
    var bbbb : Float64 = Float64(aaaa)
    var c : Float64 = -1.8*10.0**308.0
    var cc : Float64 = -2.23*10.0**-308.0
    var ccc : Float64 = 2.23*10.0**-308.0
    var cccc : Float64 = 1.8*10.0**308.0

    if (b == c && bb == cc && bbb == ccc && bbbb == cccc) {
        return 0
    }
    return 1
}
