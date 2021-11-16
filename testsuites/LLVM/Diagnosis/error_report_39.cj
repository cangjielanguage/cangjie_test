// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


@differentiable[except: [], include:[]] // EXPECTED: regex 'except' and 'include' can't be used together
func foo(input: Int64){}

func main(): Int64 {
    return 0
}

