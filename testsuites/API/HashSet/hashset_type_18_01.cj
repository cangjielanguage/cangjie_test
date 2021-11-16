// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str:List<Mut<Int64>> =List<Mut<Int64>>([Mut<Int64>()])
var r1:HashSet<Mut<Int64>> = HashSet<Mut<Int64>>(str)
var r2:HashSet<Mut<Int64>> = HashSet<Mut<Int64>>([Mut<Int64>()])

func main(): Int64 {
    if(r1.size()!=1)
    {
        return 1
    }
    if(r1.contains(str[0])!=true)
    {
        return 2
    }
    if(r2.size()!=1)
    {
        return 3
    }
    if(r2.contains(str[0])!=true)
    {
        return 4
    }
     print("success1\n")
    return 0
}

class Mut<T> <: Hashable & Equatable<Mut<T>> {
   func test(x:Int64):Int64
   {
       return x
   }
   operator func == (that: Mut<T>): Bool {
            return true;
       }
   operator func != (that: Mut<T>): Bool {
           return false
       }
   func hashCode() : UInt64 {
           return 9
       }

}