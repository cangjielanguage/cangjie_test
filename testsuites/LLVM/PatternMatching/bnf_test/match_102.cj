// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main() {
    var x = 10
    match { case _ ==> "true" case _ *=> x /= 2 } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
