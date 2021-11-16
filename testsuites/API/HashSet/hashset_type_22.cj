// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var str:List<subMut<Int64>> =List<subMut<Int64>>([Mut<Int64>(),subMut<Int64>()]) // EXPECTED: regex error.*?no matching constructor for call 'List'
    var r1:HashSet<subMut<Int64>> = HashSet<subMut<Int64>>(str)
    var r2:HashSet<subMut<Int64>> = HashSet<subMut<Int64>>([Mut<Int64>(),subMut<Int64>()])// EXPECTED: regex error.*?return type for 'init' is mismatched
    return 0
}

open class Mut<T> <: Hashable{
   func test(x:Int64):Int64{
       return x
   }
   open func hashCode() : UInt64{
       return 9
   }
}

class subMut<T> <: Mut<T> & Equatable<subMut<T>>{
   func test1(x:Int64):Int64{
       return x
   }
   override func hashCode() : UInt64{
       return 10
   }
}
extend Mut<T> <: Equatable<Mut<T>> {
   operator func == (that: Mut<T>): Bool {
            return true;
       }
   operator func != (that: Mut<T>): Bool {
           return false
       }
}
