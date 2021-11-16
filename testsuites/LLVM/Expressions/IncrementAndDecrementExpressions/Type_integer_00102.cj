// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    try {
    var int8_Low_bound_One: Int8 = -128
    var int8_Low_bound_Two: Int8 = -127
    var int8_Median_One: Int8 = -1
    var int8_Median_Two: Int8 = 0
    var int8_Median_Three: Int8 = 1
    var int8_Upper_bound_One: Int8 = 126
    var int8_Upper_bound_Two: Int8 = 127

    int8_Low_bound_One--
    int8_Low_bound_One++
    if (int8_Low_bound_One != -128) {
        return 1
    }

    int8_Low_bound_Two--
    int8_Low_bound_Two++
    if (int8_Low_bound_Two != -127) {
        return 1
    }

    int8_Median_One--
    int8_Median_One++
    if (int8_Median_One != -1) {
        return 1
    }

    int8_Median_Two--
    int8_Median_Two++
    if (int8_Median_Two != 0) {
        return 1
    }

    int8_Median_Three--
    int8_Median_Three++
    if (int8_Median_Three != 1) {
        return 1
    }

    int8_Upper_bound_One--
    int8_Upper_bound_One++
    if (int8_Upper_bound_One != 126) {
        return 1
    }

    if (int8_Upper_bound_Two != 127) {
        return 1
    }
    } catch (e: OverflowException) {
        return 0
    }
    return 1
}
