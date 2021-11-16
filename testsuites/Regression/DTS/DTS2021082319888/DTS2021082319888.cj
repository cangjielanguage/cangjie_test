// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record A {
// A(){}
    public a(){}    // EXPECTED: regex illegal record member in record block
}

class B {
// B(){}
    public a(){}    // EXPECTED: regex illegal record member in record block
}

record C {
    C(){}
    public a(){}    // EXPECTED: regex illegal record member in record block
}

record D {
    public r3(){}    // EXPECTED: regex modifier is not allowed here
}

record E {
    public E(){}    // EXPECTED: regex-not error
}

func main() {
    return 1
}
