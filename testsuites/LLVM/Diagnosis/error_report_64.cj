// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


internal interface I {}

external class A {}

extend A <: I {     // EXPECTED: regex interface 'I' must be external, external type cannot extend internal interface
    func foo(){1}
}

func main():Int64 {

    return 0
}
