// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    var data: Int32 = 1
}

func main(): Int64 {
    let val1 = {
                    Data()
                }.data

    var pattern1 = match val1 {
        case _ : Int32 => 1
        case _ => 0
    }

    if val1 != 1 || pattern1 != 1 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace