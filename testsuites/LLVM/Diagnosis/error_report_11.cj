// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo(x: Int64, y:Int32): Int64 { // EXPECTED: regex note.*found candidate
    return x + Int64(y)
}

func main():Int64 {
    foo()
    return 0
}
