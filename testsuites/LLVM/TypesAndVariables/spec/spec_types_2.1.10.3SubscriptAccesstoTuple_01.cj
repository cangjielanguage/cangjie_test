// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func multiValues(a: Int32, b: Int32) { (a + b, a - b) }  // The type of the return value of the function multiValues is Int32*Int32. 

func main(){
    var z = multiValues(8,24) // the type of z is inferred to be Int32*Int32
    print("${z[0]}")  // output: 32
    print("${z[1]}")  // output: -16
    return 0
}

