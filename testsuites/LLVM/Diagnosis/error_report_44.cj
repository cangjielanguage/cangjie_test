// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


open class A {
    func f() {}
}
extend A {
    func f() {} // EXPECTED: regex extend member 'f' is not allowed to shadow members of 'Class-A'
    func g() {}
}
class B <: A {}

func main(): Int64 {
    return 0
}


