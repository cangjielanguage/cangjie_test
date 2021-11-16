// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt  pkg.cj %f -o %output
// EXEC: %run %run_opt %output %run_args

package class_var_open_def

class Data <: Base {
    var res : Int64
    init() {
        res = one
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.res != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}