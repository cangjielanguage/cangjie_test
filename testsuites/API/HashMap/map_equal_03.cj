// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f  -o %output 2>&1 | compare %f

from std import collection.*
func main(): Int64 {
    var map01 =HashMap<Int64,Int64>([(1,2),(2,3),(1,1)])
    var map02 =HashMap<Int64,Int64>([(1,1),(2,2),(2,3)])
    if (map01 == map02){ // EXPECTED: regex error.*?'==' is not a member of class 'HashMap'
        return 0
    }
    return 1
}