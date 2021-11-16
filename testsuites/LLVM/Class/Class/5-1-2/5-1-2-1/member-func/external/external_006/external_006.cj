// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj  -o pkg1.%middle
// EXEC: %compiler %cmp_opt    %f pkg1.%middle -o %output
// EXEC: %run %run_opt %output %run_args


package pkg2
import pkg1.*

class Data <: pkg1.Base {
    func f() : Int32 {
        get() + 1
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.f() != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
