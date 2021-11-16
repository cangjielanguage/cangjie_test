// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A {}

extend A <: Any {    // EXPECTED: regex 'Any' interface is not able to be extended
    func foo():Int64{1}
}

func main():Int64 {
    return 0
}
