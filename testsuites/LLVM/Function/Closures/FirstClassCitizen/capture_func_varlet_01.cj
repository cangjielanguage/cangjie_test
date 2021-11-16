// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func case01(){
    var a: Int32 = 1
    func foo1(x!:Int32=a){return x}
    func foo2(){var x = a;return x}
    func foo3(){return a}
    func foo4(){a}
    func foo5(){a;return 1}
    var a1 = foo1 // EXPECTED: regex error.*?foo1 captured a mutable variable directly, foo1 cannot be assigned to a variable
    var a2 = foo2 // EXPECTED: regex error.*?foo2 captured a mutable variable directly, foo2 cannot be assigned to a variable
    var a3 = foo3 // EXPECTED: regex error.*?foo3 captured a mutable variable directly, foo3 cannot be assigned to a variable
    var a4 = foo4 // EXPECTED: regex error.*?foo4 captured a mutable variable directly, foo4 cannot be assigned to a variable
    var a5 = foo5 // EXPECTED: regex error.*?foo5 captured a mutable variable directly, foo5 cannot be assigned to a variable
}