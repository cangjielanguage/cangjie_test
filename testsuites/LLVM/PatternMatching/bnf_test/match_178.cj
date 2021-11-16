// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f

func main() {
    var x = "jack"
    var n = 5
    match { _ => n = 10 _ => print("5") } // EXPECTED: regex-auto missing '(' in match expression
    return 0
}
