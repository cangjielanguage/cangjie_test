// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}
var m = foo // EXPECTED: regex error.*?foo captured a mutable variable transitively, foo cannot be assigned to a variable
var n = goo // EXPECTED: regex error.*?goo captured a mutable variable transitively, goo cannot be assigned to a variable
func foo(){
    var a: Int32 = 1
    let b:Int32 = 1
    func foo1(x!:Int32=a+b){return x}
    foo1()
}

func goo() {
    var a: Int32 = 1
    let b:Int32 = 1
    func foo2(){var x = a+b;return x}
    foo2()
}

