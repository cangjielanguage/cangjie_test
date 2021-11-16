// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float64 = -3.4*10.0**38.0
    var aa : Float64 = -1.18*10.0**-38.0
    var aaa : Float64 = 1.18*10.0**-38.0
    var aaaa : Float64 = 3.4*10.0**38.0
    var b : Float32 = Float32(a)
    var bb : Float32 = Float32(aa)
    var bbb : Float32 = Float32(aaa)
    var bbbb : Float32 = Float32(aaaa)
    var c : Float32 = -339999995214436424907732413799364296704.000000
    var cc : Float32 = -0.00000000000000000000000000000000000001179999945774631092296877604951397745155570982993803082669682207931608104722887020443522487767040729522705078125
    var ccc : Float32 = 0.00000000000000000000000000000000000001179999945774631092296877604951397745155570982993803082669682207931608104722887020443522487767040729522705078125
    var cccc : Float32 = 339999995214436424907732413799364296704.000000

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
