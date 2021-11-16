// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = -3.4*10.0**38.0
    var aa : Float32 = -1.18*10.0**-38.0
    var aaa : Float32 = 1.18*10.0**-38.0
    var aaaa : Float32 = 3.4*10.0**38.0
    var b : Float64 = Float64(a)
    var bb : Float64 = Float64(aa)
    var bbb : Float64 = Float64(aaa)
    var bbbb : Float64 = Float64(aaaa)
    var c : Float64 = -339999995214436424907732413799364296704.000000
    var cc : Float64 = -0.000000000000000000000000000000000000011799998056447846598151705125784394161639578549676088950181050322247797157437787518574623391032218933105468750
    var ccc : Float64 = 0.000000000000000000000000000000000000011799998056447846598151705125784394161639578549676088950181050322247797157437787518574623391032218933105468750
    var cccc : Float64 = 339999995214436424907732413799364296704.000000

    if (b != c) {
        return 1
    }
    if (bb != cc) {
        return 1
    }
    if (bbb!= ccc) {
        return 1
    }
    if (bbbb != cccc) {
        return 1
    }
    return 0
}
