// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Char {
    var varChar: Char = '1'
    varChar = varChar && varChar  // EXPECTED: regex invalid binary operator '&&' on type 'Char' and 'Char'
    return varChar
}
