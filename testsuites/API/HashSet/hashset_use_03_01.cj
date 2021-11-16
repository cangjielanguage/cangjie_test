// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

//class HashSet<T> <: Collection<T>  where T <: Hashable, T <: Equatable<T>
from std import collection.*

var str1:List<String> = ["a","b"]
var str2:String = "c"
var r1:HashSet<String> = HashSet<String>(str1)

func main(): Int64 {
    if(r1.isChanged()==false)
    {
        print("success1\n")
        return 0
    }
    return 1
}
extend HashSet<T> where T <: Hashable, T <: Equatable<T> {
   func isChanged():Bool
   {
      return false
   }
}