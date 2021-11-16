// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let uint8_Low_bound_One: UInt8 = 0
   let uint8_Low_bound_Two: UInt8 = 1
   let uint8_Median_One: UInt8 = 127
   let uint8_Median_Two: UInt8 = 128
   let uint8_Median_Three: UInt8 = 129
   let uint8_Upper_bound_One: UInt8 = 254
   let uint8_Upper_bound_Two: UInt8 = 255

    if (uint8_Low_bound_One != 0) {
        return 1
    }

    if (uint8_Low_bound_Two != 1) {
        return 1
    }

    if (uint8_Median_One != 127) {
        return 1
    }

    if (uint8_Median_Two != 128) {
        return 1
    }

    if (uint8_Median_Three != 129) {
        return 1
    }

    if (uint8_Upper_bound_One != 254) {
        return 1
    }

    if (uint8_Upper_bound_Two != 255) {
        return 1
    }
    return 0
}
