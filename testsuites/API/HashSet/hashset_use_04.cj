// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

//class HashSet<T> <: Collection<T>  where T <: Hashable, T <: Equatable<T>
from std import collection.*

class A<T,V> where V <:HashSet<T>{
     func test(x:Int64):Int64
     {
         return x
     }
}

func main(): Int64 {
    var a =A<Int64,HashSet<Int64>> ()
    if ( a.test(4) != 4){
        return 1
    }
    print("success1\n")
    return 0
}