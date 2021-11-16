// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Option<T> { Some(T) | None }


func main(){
    let opInt32_1 = Option<Int32>.Some(100)
    let opInt32_2 = Option<Int32>.None
// coalescing operator ( ?? ), Unrealized
//    let number1: Int32 = opInt32_1 ?? 0  // number1 = 100
//    let number2: Int32 = opInt32_2 ?? 0  // number2 = 0 
    return 0
}

