// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var str:List<subMut<Int64>> =List<subMut<Int64>>([Mut<Int64>()]) // EXPECTED: regex error.*?no matching constructor for call 'List'
    var r1:HashSet<subMut<Int64>> = HashSet<subMut<Int64>>(str)
    var r2:HashSet<subMut<Int64>> = HashSet<subMut<Int64>>([Mut<Int64>()])// EXPECTED: regex error.*?return type for 'init' is mismatched
    return 0
}

open class Mut<T>{
   func test(x:Int64):Int64
   {
       return x
   }
}

class subMut<T> <: Mut<T>{
   func test1(x:Int64):Int64
   {
       return x
   }

}

extend subMut<T> <: Hashable & Equatable<subMut<T>> {
   operator func == (that: subMut<T>): Bool {
            return true;
       }
   operator func != (that: subMut<T>): Bool {
           return false
       }
   func hashCode() : UInt64 {
           return 9
       }
}