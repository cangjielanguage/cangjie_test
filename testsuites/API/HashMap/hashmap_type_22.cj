// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f


from std import collection.*
func main(): Int64 {
    HashMap<Option<Int32>,Int64>([(Option<Int32>.Some(100),1)]) //EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 0
}