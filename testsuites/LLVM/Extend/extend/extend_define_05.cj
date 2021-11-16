// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

let tuplePIE = (3.14, "PIE") 

extend tuplePIE {  // EXPECTED: regex extending type 'Invalid' is not allowed

}

func main(): Int64 {
    return 0
}
