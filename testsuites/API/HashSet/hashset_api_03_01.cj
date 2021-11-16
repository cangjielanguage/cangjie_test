// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var r1:HashSet<String> = HashSet<String>(9223372036854775808) // EXPECTED: regex error.*?the number '9223372036854775808' exceeds the value range of type 'Int64'
    var a:Int32  = 1
    var r2:HashSet<String> = HashSet<String>(a) // EXPECTED: regex error.*?parameters and arguments mismatch
    var r3:HashSet<String> = HashSet<String>(-9223372036854775809) // EXPECTED: regex error.*?the number '-9223372036854775809' exceeds the value range of type 'Int'
    return 0
}
