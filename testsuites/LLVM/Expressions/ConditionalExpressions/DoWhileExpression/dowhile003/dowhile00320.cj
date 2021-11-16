// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    do {
        [] // EXPECTED: regex empty list literal type cannot be inferred
        return 0
    } while (true)
    return 1
}
