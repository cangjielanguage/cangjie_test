// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


from std import collection.*
func main(): Int64 {
    HashMap<Result<Int32>,Int64>([Result<Int32>.Ok<Int32>(100),1)]) //EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 0
}
