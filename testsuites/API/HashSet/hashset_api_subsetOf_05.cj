// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:HashSet<String> = HashSet<String>()
var r2:HashSet<String> = HashSet<String>(["a","b","c"])
var r3:HashSet<String> = HashSet<String>(str)
var r4:HashSet<String> = HashSet<String>(3)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    if (r1.subsetOf()!=true){   // EXPECTED: regex error.*?no matching function declaration for function call 'subsetOf'
        return 1
    }
    if (r2.subsetOf()==true){  // EXPECTED: regex error.*?no matching function declaration for function call 'subsetOf'
        return 2
    }
    if (r3.subsetOf()==true){  // EXPECTED: regex error.*?no matching function declaration for function call 'subsetOf'
       return 3
    }
    if( r4.subsetOf()!=true){  // EXPECTED: regex error.*?no matching function declaration for function call 'subsetOf'
       return 4
    }
    if( r5.subsetOf()==true){  // EXPECTED: regex error.*?no matching function declaration for function call 'subsetOf'
       return 5
    }
    return 0
}
