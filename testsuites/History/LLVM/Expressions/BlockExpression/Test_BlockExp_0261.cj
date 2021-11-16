// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    var data: Int32 = 1
}

func main(): Int64 {
    let val1 = {
                    var a = Data()
                }

    var pattern1 = match val1 {
        case _ : Unit => 1
        case _ => 0
    }

    if pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace