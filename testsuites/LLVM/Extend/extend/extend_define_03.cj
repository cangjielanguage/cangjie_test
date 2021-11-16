// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

extend Nothing { // EXPECTED: regex extending type 'Invalid' is not allowed
    func plus() { this }
}

func main(): Int64 {
    return 0
}
