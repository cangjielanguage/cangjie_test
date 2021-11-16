// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func foo_tuple(): Int64{
    var tp1: Float32*String = (3.14, "PIE")
    var tp2: String*String = ("3.14", "PIE")
    var res1 = if (true) {tp1} else {("3.14", "PIE")} // EXPECTED: regex-auto Types Tuple<Float32, Record-String> and Tuple<Record-String, Record-String> of the two branches of this 'if' expression mismatch.
    var res2 = if (false) {(3.14, "PIE")} else {tp2} // EXPECTED: regex-auto Types Tuple<Float64, Record-String> and Tuple<Record-String, Record-String> of the two branches of this 'if' expression mismatch.
    if (tp1[0] == 3.14 && tp2[0] == "3.14") {
        return 0
    }
    return 1
}

func main():Int64{
    return foo_tuple()
}
