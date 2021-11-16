// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var v1: Int8 = 12
    var v2: Int8 = 10
    var v3: Int8 = 15


    if {v1}==v3 || v1 != {v1} || {v2 > v3} || {v1 >= v3} || {v1} <= v2 || v3<=#{v2}{
        return 1
    }

    return 0
}

