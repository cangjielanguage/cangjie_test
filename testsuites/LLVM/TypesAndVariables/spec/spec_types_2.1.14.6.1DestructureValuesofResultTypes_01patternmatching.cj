// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Result<T> { Ok(T) | Err(Throwable) }

func main(){
    let rInt32_1 = Result<Int32>.Ok(100)  // The type of 'rInt32_1' is 'Result<Int32>'
    let rInt32_2 = Result<Int32>.Err(Exception())  // The type of 'rInt32_2' is 'Result<Int32>'
    let number1: Int32 = match (rInt32_1) {
        case Ok(num) => num  // matched
        case Err(_) => 0
    }
    let number2: Int32 = match (rInt32_2) {
        case Ok(num) => num  // matched
        case Err(_) => 0
    }
    return 0
}

