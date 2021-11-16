// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main() {
    var i = (2, "bom")
    let X = "bom"
    match (i)  { case (2, "bom") if (if ($X == "bom")) => } // EXPECTED: regex invalid condition expr after 'if'
    return 0
}
