// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


class A{
    let a : Int32
    static operator func +(inputB:A):Int32{ // EXPECTED: regex modifiers 'static' and 'operator' are conflict in function declaration
        return 0
    }
    init(a:Int32){
        this.a = a
    }
}


func main():Int64{
    var a = A(1)
    var b = A(-1)
    return (a+b)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
