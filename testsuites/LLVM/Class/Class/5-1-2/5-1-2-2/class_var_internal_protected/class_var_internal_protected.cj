// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt  pkg.cj %f -o %output
// EXEC: %run %run_opt %output %run_args

package class_var_internal_protected

class Date <: Base{
    var res : Int64
    init() {
        res = a
    }
}

func run(): Int64 {
    var test : Int64 = Date().res
    if ( test != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}