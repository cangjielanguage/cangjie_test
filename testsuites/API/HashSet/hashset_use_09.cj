// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var str1:List<String> = ["a","b"]
var r1:HashSet<String> = HashSet<String>(str1)

func main(): Int64 {
    if ( r1.iterator()[0]!=true){   // EXPECTED: regex error.*?\'\[\]\' is not a member of class \'HashSetIterator\'
        return 1
    }
    return 0
}
