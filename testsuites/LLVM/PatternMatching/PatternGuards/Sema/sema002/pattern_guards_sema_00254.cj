// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64{
    var i : Int64 = 1
    for (x in 0..100) {
        var y : Int64 = match (i) {
            case _ if (continue) => i // EXPECTED: regex expression of Nothing type cannot appear here currently
            case _ => i + 1
        }
    }
    return 0
}
