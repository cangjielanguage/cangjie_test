// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

var arraylist:List<ArrayList<Int64>> = List<ArrayList<Int64>>([[1]])
var r1:HashSet<ArrayList<Int64>> = HashSet<ArrayList<Int64>>(arraylist)// EXPECTED: regex error.*?generics type arguments do not match the constraint
var r2:HashSet<ArrayList<Int64>> = HashSet<ArrayList<Int64>>([[1]])// EXPECTED: regex error.*?generics type arguments do not match the constraint

func main(): Int64 {
    return 0
}
