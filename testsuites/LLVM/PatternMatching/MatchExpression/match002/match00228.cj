// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f
func test(): Int64 {
    match (_) { // EXPECTED: regex-auto expected expression here
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
