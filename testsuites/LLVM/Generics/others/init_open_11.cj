// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a:A<String> = A<String>()
    return 0
}

class A<T> {
    var x:T
    open func foo(){
        return 1
    }
    init(x:T){
        this.x = x
        var a = foo() // EXPECTED: regex error.*?'open' modifier member 'foo' cannot be accessed in constructor of class 'A'
    }
}
