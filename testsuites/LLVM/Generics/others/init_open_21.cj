// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a:A = A()
    return 0
}

interface B {
    open func foo(){ // EXPECTED: regex error.*?'open' modifier is illegal for function declaration in interface body
        return 1
    }
    init(){
        var a = foo()
    }
}

class A<: B