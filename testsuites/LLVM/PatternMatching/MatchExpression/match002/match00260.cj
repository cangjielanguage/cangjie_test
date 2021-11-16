// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT:scan at least one case expression in match case body
func test(): Int64 {
    match (1) {
        CASE _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
