// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main() {
    var i: Bool = true
    match (i) { case true ||| false => case false ||| true => } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
