// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main() {
    var i = (2, 3)
    let M = 20
    match (i) { case (2, 3) if (if ($M > 0)) => case (3, 4) if (if ($M = 0)) => } // EXPECTED: regex invalid condition expr after 'if'
    return 0
}
