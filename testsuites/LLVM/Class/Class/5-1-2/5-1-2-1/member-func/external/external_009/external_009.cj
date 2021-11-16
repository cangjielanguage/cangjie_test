// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt pkg1.cj  %f -o %output
// EXEC: %run %run_opt %output %run_args


package pkg1

func run(): Int64 {
    if (Base.get() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
