// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main() {
    if (1) {    // EXPECTED: regex cannot convert an integer literal to type 'Bool'
    }
    return 0
}
