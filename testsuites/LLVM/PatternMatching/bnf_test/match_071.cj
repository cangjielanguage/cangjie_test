// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT:scan at least one case expression in match case body

func main() {
    var i = (2, 3)
    match (i) { ("zhangsan", 100) => ("\", 98) => }
    return 0
}
