// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func a(input:Int64):Int64{input}


class A{
    operator func ()(){}
    operator func ()(input:Int64){}
    operator func ()(input:(Int64)->Int64){}
    func test(){
        this()     // EXPECTED: regex invalid calling 'this' outside the constructor
        this(1|>a) // EXPECTED: regex invalid calling 'this' outside the constructor
        this(a~>a) // EXPECTED: regex invalid calling 'this' outside the constructor
    }
}


func main(): Int64 {
    return 0
}
