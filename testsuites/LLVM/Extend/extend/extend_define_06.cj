// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

extend (3.14, "PIE")  {  // EXPECTED: regex expected type
    func plus() { 1 }
}

extend Float64*String  {  // EXPECTED: regex extending type 'Tuple<Float64, Record-String>' is not allowed
    func plus() { 1 }
}

func main(): Int64 {
    return 0
}
