// EXEC-PIPE-1: %compiler %stdx_cmp_opt %n.cj -o %output 2>&1 | compare %f

from std import collection.*
func main(): Int64 {
    var map01 = HashMap<Char,Option<Int32>>([('a',Option<Int32>.Some(100)),('c',Option<Int32>.Some(1)),('b',Option<Int32>.Some(50))])
    var map02 = HashMap<Char,Option<Int32>>([('a',Option<Int32>.Some(100)),('b',Option<Int32>.Some(50)),('c',Option<Int32>.Some(1))])
    if (map01 == map02){// EXPECTED: regex error.*?'==' is not a member of class 'HashMap'
        return 0
    }
    return 1
}
