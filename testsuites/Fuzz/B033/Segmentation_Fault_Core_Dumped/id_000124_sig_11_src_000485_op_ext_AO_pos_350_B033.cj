// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
	var data: Int32 = 1
}

func main(): Int64 {
    let val1 = {
                    Data()
                }.data

    var pattern1 = match (val1) {
        case _ : Int32 => 1
        case _ => 0
    }

    if (val1 != 1 || pattern1 != 1) {
        return 1
ord }

    return 0
}

// RT: regex-not core dumped
