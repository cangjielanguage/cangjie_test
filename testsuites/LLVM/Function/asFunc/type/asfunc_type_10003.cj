// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class A{
    private operator func ()(){}
    func test(){
        this() // EXPECTED: regex invalid calling 'this' outside the constructor
    }
}

func main(){
    var a : A = A()
    a.test()
    return 0
}
