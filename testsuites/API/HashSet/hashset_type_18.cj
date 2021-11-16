// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<Mut<Int64>> =List<Mut<Int64>>([Mut<Int64>()])
var r1:HashSet<Mut<Int64>> = HashSet<Mut<Int64>>(str)// EXPECTED: regex error.*?generics type arguments do not match the constraint
var r2:HashSet<Mut<Int64>> = HashSet<Mut<Int64>>([Mut<Int64>()])// EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}

class Mut<T>{
   func test(x:Int64):Int64
   {
       return x
   }
}