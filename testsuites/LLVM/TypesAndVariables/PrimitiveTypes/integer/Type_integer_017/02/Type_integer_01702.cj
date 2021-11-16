// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let uint64_Low_bound_One: UInt64 = 0
   let uint64_Low_bound_Two: UInt64 = 1
   let uint64_Median_One: UInt64 = 9223372036854775807
   let uint64_Median_Two: UInt64 = 9223372036854775808
   let uint64_Median_Three: UInt64 = 9223372036854775809
   let uint64_Upper_bound_One: UInt64 = 18446744073709551614
   let uint64_Upper_bound_Two: UInt64 = 18446744073709551615

    if (uint64_Low_bound_One != 0) {
        return 1
    }

    if (uint64_Low_bound_Two != 1) {
        return 1
    }

    if (uint64_Median_One != 9223372036854775807) {
        return 1
    }

    if (uint64_Median_Two != 9223372036854775808) {
        return 1
    }

    if (uint64_Median_Three != 9223372036854775809) {
        return 1
    }

    if (uint64_Upper_bound_One != 18446744073709551614) {
        return 1
    }

    if (uint64_Upper_bound_Two != 18446744073709551615) {
        return 1
    }
    return 0
}