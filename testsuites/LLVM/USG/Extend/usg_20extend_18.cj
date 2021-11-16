// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A {}

extend A {
    func f() {}
    func g() {}
}

class B <: A {
    func f() {}           // EXPECTED: regex cannot override function 'f' in extend of supertype
    override func g() {}  // EXPECTED: regex cannot override function 'g' in extend of supertype
}

func main() {
    return 0
}
