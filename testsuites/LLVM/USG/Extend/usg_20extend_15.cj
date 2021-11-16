// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    var v = 0
    func foo() {}
}

extend A {
    func f() {
        print(this.v.toString()) // OK
        print(v.toString()) // OK
        foo() // OK
        this.foo() // OK
    }
}

extend Int64 {
    func add(x: Int64) {
        return this + x
    }
}
func main(): Int64{
    A().f()
    return 0
}