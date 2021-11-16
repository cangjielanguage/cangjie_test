// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let int32_let_A: Int32 = -2_1_4_7_4_8_3_6_48
    let int32_let_B: Int32 = 2_1_4_7_4_8_3_6_4_7_

    if (int32_let_A != -2147483648) {
        return 1
    }

    if (int32_let_B != 2147483647) {
        return 1
    }

    return 0
}
