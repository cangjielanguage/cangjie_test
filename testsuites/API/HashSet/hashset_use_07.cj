// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

//class HashSet<T> <: Collection<T>  where T <: Hashable, T <: Equatable<T>
from std import collection.*

var str1:List<String> = ["a","b"]
var r1:HashSet<String> = HashSet<String>(str1)

func foo(value!:Int64 = r1.size()):Int64{
    return r1.capacity()
}

func main(): Int64 {
    if ( foo() != 16){
        return 1
    }
    print("success1\n")
    return 0
}
