// EXEC: %compiler %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-auto all enum constructors must be covered in match

enum TimeUnit {
    Year(Int32) | Month(Int32)
}

func main(): Int64 {
    var time = TimeUnit.Year(8)
    var res: Int32 = match (time) {
        case Year(x) => 2020
    }

    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
