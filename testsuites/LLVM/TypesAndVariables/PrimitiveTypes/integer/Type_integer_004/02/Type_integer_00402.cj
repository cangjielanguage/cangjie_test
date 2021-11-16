// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let int8_Low_bound_One: Int8 = -0B10000000
   let int8_Low_bound_Two: Int8 = -0B01111111
   let int8_Median_One: Int8 = -0B00000001
   let int8_Median_Two: Int8 = 0B00000000
   let int8_Median_Three: Int8 = 0B00000001
   let int8_Upper_bound_One: Int8 = 0B01111110
   let int8_Upper_bound_Two: Int8 = 0B01111111

    if (int8_Low_bound_One != -128) {
        return 1
    }

    if (int8_Low_bound_Two != -127) {
        return 1
    }
    
    if (int8_Median_One != -1) {
        return 1
    }
    
    if (int8_Median_Two != 0) {
        return 1
    }
    
    if (int8_Median_Three != 1) {
        return 1
    }
    
    if (int8_Upper_bound_One != 126) {
        return 1
    }
    
    if (int8_Upper_bound_Two != 127) {
        return 1
    }

    return 0
}
