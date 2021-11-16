// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func larger(a: Int32, b: Int32): Unit {
    if (a == b) {
        print("a is equal to b")
        return
    } else {
        print("a is not equal to b")
    }
} 

func main(): Int64 {
    larger(1,2) 
    return 0  
}



