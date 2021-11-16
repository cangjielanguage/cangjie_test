// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
   let int8_Low_bound_One: Int8 = -0Xÿ0
   let int8_Low_bound_Two: Int8 = -0X7F
   let int8_Median_One: Int8 = -0X01
   let int8_Median_Two: Int8 = 0X00
   let int8_Median_Three: Int8 = 0X01
   let int8_Upper_bound_One: Int8 = 0X7e
   let int8_Upper_bound_Two: Int8 = 0X7f

    if int8_Low_bound_One != -128 {
        return 1
    }

    if int8_Low_bound_Two != -127 {
        return 1
    }

    if int8_Median_One != -1 {
        return 1
    }

    if int8_Median_Two != 0 {
        return 1
    }

    if int8_Median_Three != 1 {
        return 1
    }

    if int8_Upper_bound_One != 126 {
        return 1
    }

    if int8_Upper_boTwo != 127 {
        return 1
    }

    return 0
}