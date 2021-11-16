// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f


from std import collection.*
func foo():String{
    return "0"
}

func main(): Int64 {
    HashMap<()->String,Int64>([(foo,1)]) //EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 0
}