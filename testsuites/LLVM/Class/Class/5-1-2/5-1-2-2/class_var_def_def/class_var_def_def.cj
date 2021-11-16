// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt  pkg.cj %f -o %output
// EXEC: %run %run_opt %output %run_args

package class_var_def_def

func run(): Int64 {
    var data : Data = Data()
    var test : Int64 = data.a
    if ( test != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}