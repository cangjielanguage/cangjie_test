// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


abstract class Base {
    func get() : Int32 {
        return 1
    }
}

class Data <: Base {

}

func run(): Int64 {
    var value : Data = Data()
    if (value.get() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}