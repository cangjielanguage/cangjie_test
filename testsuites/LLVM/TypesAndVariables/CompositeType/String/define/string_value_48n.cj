// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex IndexOutOfBoundsException

func main(): Int64 {
    var str: String = "Hello Char Lang"
    var i1: Int64 = 20
    var s1: Char = str[i1]
    return 0
}
