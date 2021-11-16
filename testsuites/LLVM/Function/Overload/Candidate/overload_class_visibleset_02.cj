// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    static func foo(x:Int32): Int32 { return x**2 }
    func bar(x:Int32) { return x }
}

interface I {
    static func foo(x:Int64): String { x.toString()}
    func bar(x:Int32) { return x }
}

record Data {
    static func foo(): Int64 { 3 }
    func bar(x:Int32) { return x }
}


func main(): Int64 {
    var res1 = A.bar(2)  // EXPECTED: regex 'bar' is non-static member, cannot access by type name
    var res2 = I.bar(2)  // EXPECTED: regex function 'bar' cannot be accessed by interface name 'I'
    var res3 = Data.bar(2)  // EXPECTED: regex 'bar' is non-static member, cannot access by type name
    if (res == 2) {
        return 0
    }
    return 1
}