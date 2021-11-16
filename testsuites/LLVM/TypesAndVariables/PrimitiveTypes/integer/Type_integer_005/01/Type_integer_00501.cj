// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   var int32_Low_bound_One: Int32 = -2147483648
   var int32_Low_bound_Two: Int32 = -2147483647
   var int32_Median_One: Int32 = -1
   var int32_Median_Two: Int32 = 0
   var int32_Median_Three: Int32 = 1
   var int32_Upper_bound_One: Int32 = 2147483646
   var int32_Upper_bound_Two: Int32 = 2147483647

    if (int32_Low_bound_One != -2147483648) {
        return 1
    }
    
    if (int32_Low_bound_Two != -2147483647) {
        return 1
    }
    
    if (int32_Median_One != -1) {
        return 1
    }
    
    if (int32_Median_Two != 0) {
        return 1
    }
    
    if (int32_Median_Three != 1) {
        return 1
    }
    
    if (int32_Upper_bound_One != 2147483646) {
        return 1
    }
    
    if (int32_Upper_bound_Two != 2147483647) {
        return 1
    }
    return 0
}
