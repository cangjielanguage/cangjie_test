// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Exception RuntimeException ArithmeticException

func div(a: Int32, b: Int32): Int32 {
    if (b != 0) {
        return a / b
    } else {
       throw ArithmeticException()
    }
}

func main(){
    div(3,0) 
    return 0
}

