// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func larger(a: Int32, b: Int32): Int32 {
    if (a >= b) {
        return a
    } else {
        return b
    }
} 

func main(): Int64 {
    larger(1,2) 
    return 0  
}



