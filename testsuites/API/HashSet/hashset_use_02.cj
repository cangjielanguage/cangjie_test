// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

//class HashSet<T> <: Collection<T>  where T <: Hashable, T <: Equatable<T>
from std import collection.*

var str1:List<String> = ["a","b"]
var str2:String = "c"
var r1:HashSet<String> = HashSet<String>(str1)

func test(x:HashSet<String>):HashSet<String>
{
     x.put(str2)
     return x
}

func main(): Int64 {
    test(r1)
    return 0
}
class myclass <: HashSet  // EXPECTED: regex error.*?super class \'HashSet\' is not inheritable, use \'open\' modifier instead
{

}