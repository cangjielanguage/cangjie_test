// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let int64_Low_bound_One: Int64 = -9223372036854775808
   let int64_Low_bound_Two: Int64 = -9223372036854775807
   let int64_Median_One: Int64 = -1
   let int64_Median_Two: Int64 = 0
   let int64_Median_Three: Int64 = 1
   let int64_Upper_bound_One: Int64 = 9223372036854775806
   let int64_Upper_bound_Two: Int64 = 9223372036854775807

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