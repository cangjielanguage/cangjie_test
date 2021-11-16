// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a:Int64 = -3*-4**3
    var b:Float16  = 4.0**(-1.0*1.0)
    var c: Int64  = -2**2-1
    var d  = 2**2+100/2%3-1
    var e  = 2**2**2**2
    var f = Int32(2.0**(2.0+.6)**2.0**2.0)
    var g  = -2**(2**2**2)
    a++
    a--
    b++;b--
    c++;c--
    d++;d--
    var h: Float32 = -2.0**(-1.0)*2.0
    if (a !=  192) {
        return 1
    }
    if (b != 0.250000) {
        return 1
    }
    if (c != 3) {
        return 1
    }
    if (d != 5) {
        return 1
    }
    if (e != 256) {
        return 1
    }
    if (f != 1351) {
        return 1
    }
    if (g != 65536) {
        return 1
    }
    if (h != -1.0) {
        return 1
    }



    return 0
}
