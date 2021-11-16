// EXEC: %compiler %stdx_cmp_opt  %f -o %output 2>&1 | compare %f

from std import util.*
from std import collection.*
func main()
{
    var n=Random()
    var n1=Random()
    var n2=Random()
    var hset:HashSet<Random>=HashSet<Random>([n,n1,n2])  // EXPECTED: regex error.*?generics type arguments do not match the constraint
    print("success\n")
    return 0
}
