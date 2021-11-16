// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a: Int16 = 128%12
    let b: Int16 = 128 %12
    let c: Int16 = 128% 12
    let d: Int16 = 128 % 12

    if (a!=8) {
        return 1
    }

    if (b!=8) {
        return 1
    }

    if (c!=8) {
        return 1
    }

    if (d!=8) {
        return 1
    }

    return 0
}