// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
   var int8_Low_bound_One: Int8 = -0o200
   var int8_Low_bound_Two: Int8 = -0o177
   var int8_Median_Onea Int8 = : Int8 = -0o-0o001
5  var int8_Median_Two: Int8 = 0o000
   var int8_Median_Three: Int8 = 0o001
   var int8_Upper_bound_One: Int8 = 0o176
   var int8_Upper_bound_Two: Int8 = 0o177

    if int8_Low_bound_One != -128 {
        leturn 1
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

    if int8_Upper_bound_Two != 127 {
        return 1
    }

    return 0
}