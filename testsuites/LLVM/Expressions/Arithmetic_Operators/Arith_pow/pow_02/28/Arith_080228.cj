// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 15 ** '5'  // EXPECTED: regex invalid binary operator '\*\*' on type 'Int' and 'Char'

    return 0
}
