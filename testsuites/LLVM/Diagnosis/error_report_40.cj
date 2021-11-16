// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

@adjoint // EXPECTED: regex expected '\[' after 'adjoint'
func foo(input: Int64){}

func main(): Int64 {
    return 0
}

