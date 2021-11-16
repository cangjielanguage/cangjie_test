// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt  %f pkg1.%middle -o %output
// EXEC: %run %run_opt %output %run_args 


package pkg2
import pkg1.*


func run(): Int64 {
    if (pkg1.Base.get() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
