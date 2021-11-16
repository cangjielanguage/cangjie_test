// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func multiValues(a: Int32, b: Int32) { (a + b, a - b) }  // The type of the return value of the function multiValues is Int32*Int32

func main(){
    var (x, y) = multiValues(8,24)  // Define an anonymous tuple who has two elements, i.e., x and y
    print("${x}")  // output: 32 
    print("${y}")  // output: -16
    return 0
}

