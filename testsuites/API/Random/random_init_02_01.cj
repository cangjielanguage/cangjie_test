// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import util.*
func main()
{
    var seed:Int64=65
    var r=Random(seed)   // EXPECTED: regex error.*?no matching constructor for call 'Random'
    var r=Random(34,45)   // EXPECTED: regex error.*?no matching constructor for call 'Random'
    return 0
}