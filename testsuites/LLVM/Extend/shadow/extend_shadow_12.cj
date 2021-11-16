// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

extend A {
    func foo1() {
        foo2() // EXPECTED: regex undeclared identifier 'foo2'
    }
}

extend A {
    func foo2() {
        foo1() // EXPECTED: regex undeclared identifier 'foo1'
    }
}

class A {}

extend A {
    func foo3(){
        foo1() // EXPECTED: regex undeclared identifier 'foo1'
    }
}

func main(): Int64 {
    return 0
}
