// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import util.*

func main()
{
    var r=Random(UInt64(65))
    var r1=Random()
    r.setSeed(-5)  // EXPECTED: regex error.*?the number '-5' exceeds the value range of type 'UInt64'
    r1.setSeed(-5) // EXPECTED: regex error.*?the number '-5' exceeds the value range of type 'UInt64'
    r.setSeed(18446744073709551616)  // EXPECTED: regex error.*?the number '18446744073709551616' exceeds the value range of type 'UInt64'
    r1.setSeed(18446744073709551616) // EXPECTED: regex error.*?the number '18446744073709551616' exceeds the value range of type 'UInt64'
    return 0
}