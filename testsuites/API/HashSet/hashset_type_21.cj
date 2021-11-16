// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str:List<Mut<Int64>> =List<Mut<Int64>>([Mut<Int64>(),subMut<Int64>()])
    var r1:HashSet<Mut<Int64>> = HashSet<Mut<Int64>>(str)
    var r2:HashSet<Mut<Int64>> = HashSet<Mut<Int64>>([Mut<Int64>(),subMut<Int64>()])
    if(r1.size()!=2)
    {
        return 1
    }
    if(r1.contains(str[0])!=true)
    {
        return 2
    }
    if(r1.contains(str[1])!=true)
    {
        return 3
    }
    if(r2.size()!=2)
    {
        return 4
    }
    if(r2.contains(str[0])!=true)
    {
        return 5
    }
    if(r2.contains(str[1])!=true)
    {
        return 6
    }
     print("success1\n")
    return 0
}

open class Mut<T> <: Hashable {
   func test(x:Int64):Int64
   {
       return x
   }
   open func hashCode() : UInt64 {
       return 9
   }
}

class subMut<T> <: Mut<T>{
   func test1(x:Int64):Int64
   {
       return x
   }
   override func hashCode() : UInt64 {
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