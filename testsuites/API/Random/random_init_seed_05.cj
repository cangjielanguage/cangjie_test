// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import util.*
func main()
{
    var r1=Random(-1)// EXPECTED: regex error.*?the number '-1' exceeds the value range of type 'UInt64'
    var r2=Random(18446744073709551616)// EXPECTED: regex error.*?the number '18446744073709551616' exceeds the value range of type 'UInt64'
    return 0
}