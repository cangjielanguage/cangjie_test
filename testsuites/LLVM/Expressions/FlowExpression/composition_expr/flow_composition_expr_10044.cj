// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace




class A{
    operator func ()(input:A){}
    func test(){
        this |> this // EXPECTED: regex  'this' is not allowed to be used in flow expressions
    }
}

func main(): Int64 {
    A().test()
    return 0
}
