// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let int32_let_A: Int32 = -2_1__4___7____4_____8______3_______6________4_________8
    let int32_let_B: Int32 = 2__________1_________4________7_______4______8_____3____6___4__7_

    if (int32_let_A != -2147483648) {
        return 1
    }

    if (int32_let_B != 2147483647) {
        return 1
    }

    return 0
}
