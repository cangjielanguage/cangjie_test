// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a: Int8 = -127
//    let b: Int8 = ---+127
//    let c: Int8 = -+--127

    if (a != -127) {
         return 1
    }
/*
    if (b != -127) {
         return 1
    }

    if (c != -127) {
         return 1
    }
*/
    return 0
}
