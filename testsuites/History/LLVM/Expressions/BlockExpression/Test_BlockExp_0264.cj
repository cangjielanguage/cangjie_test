// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T>{
    let data: T
    init(x: T){
        data = x
    }
}

func main(): Int64 {
    let val1 = {
                    Data<Int32>(3)
                }

    var pattern1 = match val1 {
        case _ : Data<Int32> => 1
        case _ => 0
    }

    if val1.data != 3 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace