// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo(x: Int64): Int64 { // EXPECTED: regex note.*found candidate
    return x
}

func main():Int64 {
    foo(1,2)
    return 0
}
