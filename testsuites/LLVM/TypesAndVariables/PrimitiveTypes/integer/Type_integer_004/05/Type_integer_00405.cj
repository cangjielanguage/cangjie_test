// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let int8_Low_bound_One: Int8 = -0O200
   let int8_Low_bound_Two: Int8 = -0O177
   let int8_Median_One: Int8 = -0O001
   let int8_Median_Two: Int8 = 0O000
   let int8_Median_Three: Int8 = 0O001
   let int8_Upper_bound_One: Int8 = 0O176
   let int8_Upper_bound_Two: Int8 = 0O177

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
