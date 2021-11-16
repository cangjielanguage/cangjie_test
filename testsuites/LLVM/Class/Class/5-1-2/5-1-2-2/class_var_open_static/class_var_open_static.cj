// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt  pkg.cj %f -o %output
// EXEC: %run %run_opt %output %run_args

package class_var_open_static

func run(): Int64 {
    if (Base.one != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}