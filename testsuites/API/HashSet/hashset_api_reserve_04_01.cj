// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:HashSet<Int64> = HashSet<Int64>()
    var r4:HashSet<String> = HashSet<String>(3)
    r1.reserve(9223372036854775808)// EXPECTED: regex error.*?the number \'9223372036854775808\' exceeds the value range of type \'Int64\'
    r4.reserve(9223372036854775808)// EXPECTED: regex error.*?the number \'9223372036854775808\' exceeds the value range of type \'Int64\'
    return 0
}