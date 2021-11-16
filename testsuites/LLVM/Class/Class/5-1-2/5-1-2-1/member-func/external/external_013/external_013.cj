// DEPENDENCE: pkg1.cj pkg.cfg1
// EXEC: %compiler %cmp_opt -c pkg1.cj  -o pkg1.%middle
// EXEC: %compiler %cmp_opt   %f pkg1.%middle -o %output
// EXEC: %run %run_opt %output %run_args 


package pkg2
import pkg1.*

class Data <: pkg1.Base {
    override func  get() : Int32 {
        return  2
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.get() != 2) {
        return 1 
    }
    return 0
}

func main(): Int64 {
    return run()
}
