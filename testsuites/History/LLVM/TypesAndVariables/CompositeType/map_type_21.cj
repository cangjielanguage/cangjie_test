// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    var map01 = #{():100 } // EXPECTED: regex error.*?return type mismatch
    return 0
}