// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT:scan expected expression here

func test(): Int64 {
    match (type mytype = Int32) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
