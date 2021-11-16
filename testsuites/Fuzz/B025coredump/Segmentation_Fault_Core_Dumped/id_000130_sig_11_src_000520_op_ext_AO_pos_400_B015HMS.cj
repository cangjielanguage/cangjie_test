// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

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
ord }

    return 0
}

