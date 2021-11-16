// DEPENDENCE: pkgs_import_invoke_21b.cj
// EXEC: %compiler %cmp_opt %f pkgs_import_invoke_21b.cj -o %output
// EXEC: %run %run_opt %output %run_args

package pkgs_import_invoke_21


func run(): Int64 {
    if (test != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
