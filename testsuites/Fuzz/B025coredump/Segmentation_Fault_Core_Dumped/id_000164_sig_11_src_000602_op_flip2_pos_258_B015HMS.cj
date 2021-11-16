// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var v1: Int32 = 12
    var v2: Int32 = 10
    var v3: Int32 = 15


    var a = ~{v1}
    var b = {v1}<<{1}<<1
    var c = {v1}>>{2}
    var d = {v2 &#v3}
    var e = v2 ^ {v3}
    var f = v2 | {v3}

    if a != -13 || b != 48 || c != 3 ||  d != 10 || e != 5 || f != 15 {
        return 1
    }

    return 0
}

