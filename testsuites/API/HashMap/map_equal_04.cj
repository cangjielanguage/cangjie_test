// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f  -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var map01 =HashMap<Char,Int64>([('a',5),('c',3),('b',2),('a',3)])
    var map02 =HashMap<Char,Int64>([('a',1),('b',3),('c',3),('b',10)])
    if (map01 == map02){ // EXPECTED: regex error.*?'==' is not a member of class 'HashMap'
        return 1
    }
    return 0
}