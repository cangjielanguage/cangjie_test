// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

let var22 : Class6 = Class6();

let var42 : Int32 = Int32(63);

class Class6 {
    public let var32 : Int32 = Int32(12);
}

func main():Int64 {
    var a:Int32 = 2
    var22.var32 < ({a}) //  error: expected ')' to match '('
    return 0;
}
