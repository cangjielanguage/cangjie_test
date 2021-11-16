// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let c: Int16 = 127
    -       // EXPECTED: regex expected expression here
    128

    if (c!=-1) {
        return 1
    }

    return 0
}
