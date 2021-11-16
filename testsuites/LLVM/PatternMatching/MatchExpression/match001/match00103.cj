// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func test(): Int64 {
    var i : Int32 = 0
    mat ch i { // EXPECTED: regex undeclared identifier 'mat'
        case 0 => "0"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
