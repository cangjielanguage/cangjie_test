// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = infinity + infinity
    let b = infinity * infinity
    let c = -infinity-infinity
    let d = (-infinity)*(-infinity)

    if (a != infinity) {
        return 1
    }
    if (b != infinity) {
        return 1
    }
    if (c != -infinity) {
        return 1
    }
    if (d != infinity) {
        return 1
    }

    return 0
}