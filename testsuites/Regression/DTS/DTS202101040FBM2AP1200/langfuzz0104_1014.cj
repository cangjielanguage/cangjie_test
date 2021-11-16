// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

let var22 : Class6 = Class6();
class Class6 {
    public let var32 : Int32 = Int32(12);
}

func main(): Int64 {
    var a = {
        var22;
    }().var32
    return 0;
}