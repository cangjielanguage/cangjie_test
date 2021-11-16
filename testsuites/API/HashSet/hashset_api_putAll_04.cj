// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:HashSet<String> = HashSet<String>()
var r2:HashSet<String> = HashSet<String>(["a","b","c"])
var r3:HashSet<String> = HashSet<String>(str)
var r4:HashSet<String> = HashSet<String>(3)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    var list1:List<String> = ["e","f"]
    var list2:List<String> = ["3","4"]
    r1.putAll("m")// EXPECTED: regex error.*?no matching function declaration for function call 'putAll'
    r2.putAll("m")// EXPECTED: regex error.*?no matching function declaration for function call 'putAll'
    r3.putAll("m")// EXPECTED: regex error.*?no matching function declaration for function call 'putAll'
    r4.putAll("m")// EXPECTED: regex error.*?no matching function declaration for function call 'putAll'
    r5.putAll("m")// EXPECTED: regex error.*?no matching function declaration for function call 'putAll'
    return 0
}
