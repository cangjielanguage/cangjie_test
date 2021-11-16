// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a:Array<Int64> = Array<Int64>([0,1,2])
    var c = (return 1) // EXPECTED: regex error.*initialization expression of Nothing type is not supported currently
    if ( match(c){case _ => false}) {
        return 1
    }
    return 0
}
