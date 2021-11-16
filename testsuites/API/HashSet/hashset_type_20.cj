// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var str:List<subMut<Int64>> =List<subMut<Int64>>([Mut<Int64>()]) // EXPECTED: regex error.*?no matching constructor for call 'List'
    var r1:HashSet<subMut<Int64>> = HashSet<subMut<Int64>>(str)// EXPECTED: regex error.*?generics type arguments do not match the constraint
    var r2:HashSet<subMut<Int64>> = HashSet<subMut<Int64>>([Mut<Int64>()])// EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 0
}

open class Mut<T>{
   func test(x:Int64):Int64
   {
       return x
   }
}

class subMut<T> <: Mut<T>{
   func test(x:Int16):Int16
   {
       return x
   }
}