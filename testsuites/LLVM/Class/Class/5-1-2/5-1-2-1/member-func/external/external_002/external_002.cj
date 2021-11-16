// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj  -o pkg1.%middle
// EXEC: %compiler %cmp_opt  pkg1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args 

package pkg2
import pkg1.*

func run(): Int64 {
    var data : pkg1.Data = pkg1.Data()
    if (data.get() != 1) {
        return 1 
    }
    return 0
}

func main(): Int64 {
    return run()
}
