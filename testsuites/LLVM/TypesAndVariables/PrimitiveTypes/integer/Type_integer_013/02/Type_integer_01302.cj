// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
   let uint16_Low_bound_One: UInt16 = 0
   let uint16_Low_bound_Two: UInt16 = 1
   let uint16_Median_One: UInt16 = 32766
   let uint16_Median_Two: UInt16 = 32767
   let uint16_Median_Three: UInt16 = 32768
   let uint16_Upper_bound_One: UInt16 = 65534
   let uint16_Upper_bound_Two: UInt16 = 65535

    if (uint16_Low_bound_One != 0) {
        return 1
    }

    if (uint16_Low_bound_Two != 1) {
        return 1
    }

    if (uint16_Median_One != 32766) {
        return 1
    }

    if (uint16_Median_Two != 32767) {
        return 1
    }

    if (uint16_Median_Three != 32768) {
        return 1
    }

    if (uint16_Upper_bound_One != 65534) {
        return 1
    }

    if (uint16_Upper_bound_Two != 65535) {
        return 1
    }
    return 0
}
