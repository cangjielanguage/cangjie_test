// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class A<T>{
    private operator func ()(input:T){}
    func test(input:T){
        this(input) // EXPECTED: regex invalid calling 'this' outside the constructor
    }
}

func main(){
    var a : A<Int64> = A<Int64>()
    a.test(1)
    return 0
}
