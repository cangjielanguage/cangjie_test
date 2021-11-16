// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:HashSet<String> = HashSet<String>()
var r2:HashSet<String> = HashSet<String>(["a","b","c"])
var r3:HashSet<String> = HashSet<String>(str)
var r4:HashSet<String> = HashSet<String>(3)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    r1.remove(1)  // EXPECTED: regex error.*?no matching function declaration for function call 'remove'
    r2.remove(1)  // EXPECTED: regex error.*?no matching function declaration for function call 'remove'
    r3.remove(1)  // EXPECTED: regex error.*?no matching function declaration for function call 'remove'
    r4.remove(1)  // EXPECTED: regex error.*?no matching function declaration for function call 'remove'
    r5.remove(1)  // EXPECTED: regex error.*?no matching function declaration for function call 'remove'
    return 0
}
