// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var c =((match(1){case _ =>1} == match(1){case _ =>1} ) & (match(1){case _ =>1} == match(1){case _ =>1} ) ) // EXPECTED: regex invalid binary operator '&' on type 'Bool' and 'Bool'
    if ( c != 1 ){
        return 1
    }
    return 0
}
