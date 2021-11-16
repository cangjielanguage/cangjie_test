// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main() {
    var x = 10
    match { case true || false => x = 20 case false && true  => 50 ] // EXPECTED: regex expected '}'
    return 0
}
