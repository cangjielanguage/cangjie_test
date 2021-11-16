// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var lit01 = -2.4e-1+1.0+1.0
    var lit02 = (2e1)+-1.1
    var lit03 = -.128e2+-0x1.1p0
    var lit04 = -0x1.1p0+-0X1p2
    var lit05 = -0x1p2- -0X.2p4
    var lit06 = 0x1p2*0X.2p4

    if (lit01 != 1.76) {
        return 1
    }
    if (lit02 != 18.9) {
        return 1
    }
    if (lit03 != -13.8625) {
        return 1
    }
    if (lit04 != -5.0625) {
        return 1
    }
    if (lit05 != -2.0) {
        return 1
    }
    if (lit06 != 8.0) {
        return 1
    }
    return 0
}