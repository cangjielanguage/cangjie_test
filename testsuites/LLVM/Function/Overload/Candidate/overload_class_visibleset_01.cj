// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    static func foo(x:Int32): Int32 { return x**2 }
    func bar(x:Int32) { return x }
}

record Data {
    static func foo(): Int64 { 3 }
    func bar(x:Int32) { return x }
}


func main(): Int64 {
    var res1 = A.foo(2)
    var res3 = Data.foo()
    if (res1 == 4 && res3 == 3) {
        return 0
    }
    return 1
}