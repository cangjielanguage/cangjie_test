// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a  = -128 + 567*3/4-3%3**3
    var b  = (-128+ 567)*3/4-3%(-3)**2
    var c: Float64  = Float64(-128+ -567)*3.0/4.0-3.0%-3.0**3.0
    var d = Float64(0b11*0x18**0b11/2)+Float64(0o30)%0x1.1p0- -2.4e-1
    a++;a--
    b++;b--
    c++;c--
    d++;d--
    if (a != 294) {
        return 1
    }
    if (b != 326) {
        return 2
    }
    if (c != -524.25) {
        return 3
    }
    if (d != 20736.865) {
        return 4
    }
    return 0
}
