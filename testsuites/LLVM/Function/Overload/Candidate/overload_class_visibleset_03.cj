// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    static private func foo(x:Int32): Int32 { return x**2 }
    func bar(x:Int32) { return A.foo(2) }
}

record Data {
    static private func foo(): Int64 { 3 }
    func bar(x:Int32) { return Data.foo() }
}

func main(): Int64 {
    var res1 = A.foo(2)
    var res3 = Data.foo()   // EXPECTED: regex no matching function declaration for function call 'foo'
    if (res1 == 4 && res3 == 3) {
        return 0
    }
    return 1
}