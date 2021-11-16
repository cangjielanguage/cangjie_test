// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output  %run_args 


abstract class BaseA {
    func getA() : Int32
}

class Data <: BaseA {
    public func getA() : Int32 {
        return 2
    }
}

func main():Int64{
    var a = Data()
    if (a.getA() != 2) {return 1}
    0
}
