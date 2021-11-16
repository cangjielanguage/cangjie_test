// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    func foo():Int64{1}
}
class B {
    func bar():Int64{1}
}


func main():Int64{
    var a: A = A()
    var b: B = B()
    a = b       // EXPECTED: regex type incompatible in this assignment
    if (a.bar() != 1) {
        return 0
    }
    return 1

}