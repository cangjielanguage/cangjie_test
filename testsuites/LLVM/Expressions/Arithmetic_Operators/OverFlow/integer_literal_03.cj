// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var lit01 = 0b0001_1000_ + -0
    let lit02 = (0o30 + -0b0001_1000_+1)*-0b0001_1000_
    let lit03 = (0b0_001_1000__ - -2_4_+1)/0X2f
    let lit04 = 0x18 - -0o30-1
    var lit05 = -0_ * 0X18
    let lit06 = 0x18 == 0o30
    if (lit01 == 24 && lit02 == -24 && lit03 == 1 && lit04 == 47 && lit05 == 0 && lit06) {
        return 0
    }
    return 1
}