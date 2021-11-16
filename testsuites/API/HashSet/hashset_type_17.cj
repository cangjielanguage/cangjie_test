// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<Mut> =List<Mut>([Mut()])
var r1:HashSet<Mut> = HashSet<Mut>(str)// EXPECTED: regex error.*?generics type arguments do not match the constraint
var r2:HashSet<Mut> = HashSet<Mut>([Mut()])// EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}

class Mut{
   func test(x:Int64):Int64
   {
       return x
   }
}