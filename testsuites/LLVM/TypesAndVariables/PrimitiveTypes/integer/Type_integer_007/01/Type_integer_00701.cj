// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   var int64_Low_bound_One: Int64 = -9223372036854775808
   var int64_Low_bound_Two: Int64 = -9223372036854775807
   var int64_Median_One: Int64 = -1
   var int64_Median_Two: Int64 = 0
   var int64_Median_Three: Int64 = 1
   var int64_Upper_bound_One: Int64 = 9223372036854775806
   var int64_Upper_bound_Two: Int64 = 9223372036854775807

    if (int64_Low_bound_One != -9223372036854775808) {
        return 1
    }
    
    if (int64_Low_bound_Two != -9223372036854775807) {
        return 1
    }

    if (int64_Median_One != -1) {
        return 1
    }

    if (int64_Median_Two != 0) {
        return 1
    }

    if (int64_Median_Three != 1) {
        return 1
    }

    if (int64_Upper_bound_One != 9223372036854775806) {
        return 1
    }

    if (int64_Upper_bound_Two != 9223372036854775807) {
        return 1
    }
    return 0
}
