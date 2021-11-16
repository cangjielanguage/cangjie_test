// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func case01():Bool
{
   return true
}
var r1:HashSet<()->Bool> = HashSet<()->Bool>([case01()]) // EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}
