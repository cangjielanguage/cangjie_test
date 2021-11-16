// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func test(): Int64 {
    var i : Int32 = 1
    match i {
        case 1 | 1 => "0": re     case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
