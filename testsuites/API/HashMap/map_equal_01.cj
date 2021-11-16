// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f  -o %output 2>&1 | compare %f


from std import collection.*
func main(): Int64 {

    var map01 = HashMap<Char,Int64>([('a',1),('c',3),('b',2)])
    var map02 =HashMap<Char,Int64>([('a',1),('b',2),('c',3)]) #{'a':1,'b':2,'c':3}
    print("123456\n")
    if (map01 == map01){  // EXPECTED: regex error.*? '==' is not a member of class 'HashMap'
        return 0
    }
    return 1
}