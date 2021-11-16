// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    private var v1 = 0
    protected var v2 = 0
}

extend A {
    func f() {
        print(v1) // EXPECTED: regex can not access field 'v1'
        print(v2) // EXPECTED: regex can not access field 'v2'
    }
}

class B {
    func f() {}
}

extend B {
    func f() {} // EXPECTED: regex extend member 'f' is not allowed to shadow members of 'Class-B'
}

class Foo {}

extend Foo {
    func f() {}
    func g() {}
}

extend Foo {
    func h() {
        g() // EXPECTED: regex undeclared identifier 'g'
    }
    func f() {}
}

func main() {
    return 0
}