// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var int8_Low_Median_One = 128

    if (int8_Low_Median_One == 128) {
        return 0
    } else {
        return 1
    }
}
