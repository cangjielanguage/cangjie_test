// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:HashSet<String> = HashSet<String>()
var r2:HashSet<String> = HashSet<String>(["a","b","c"])
var r3:HashSet<String> = HashSet<String>(str)
var r4:HashSet<String> = HashSet<String>(3)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    r1.put(1)  // EXPECTED: regex error.*?no matching function declaration for function call 'put'
    r2.put(2)  // EXPECTED: regex error.*?no matching function declaration for function call 'put'
    r3.put(3)  // EXPECTED: regex error.*?no matching function declaration for function call 'put'
    r4.put(4)  // EXPECTED: regex error.*?no matching function declaration for function call 'put'
    r5.put(5)  // EXPECTED: regex error.*?no matching function declaration for function call 'put'
    return 0
}
