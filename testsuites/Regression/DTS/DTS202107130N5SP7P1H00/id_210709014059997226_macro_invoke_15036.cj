// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
    return 0
    return 0

importmut define.*

mutmut    return 0
    return 0
foreign{
@VAR_A(@VAR_B var x = 1)

@VAR_B @VAR_C[0](0)

@VAR_C[0](@VAR_D[0] var x = 1)

@"VAR_D[0]@VAR_A(0)
}mutmut

func main(mut%){%
    0
    return 0
}
