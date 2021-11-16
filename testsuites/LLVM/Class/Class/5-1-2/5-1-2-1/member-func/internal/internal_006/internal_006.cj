// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt pkg1.cj %f -o %output
// EXEC: %run %run_opt %output %run_args 


package pkg1

class Data <: Base {
    func f() {
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

