// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = infinity/0
    let b = infinity/1.0
    let c = -infinity/0
    let d = -infinity/1.0
    let e = infinity/-1.0
    let f = -infinity/-1.0



    if (a != infinity) {
        return 1
    }
    if (b != infinity) {
        return 1
    }
    if (c != -infinity) {
        return 1
    }
    if (d != -infinity) {
        return 1
    }
    if (e != -infinity) {
        return 1
    }
    if (f != infinity) {
        return 1
    }

    return 0
}