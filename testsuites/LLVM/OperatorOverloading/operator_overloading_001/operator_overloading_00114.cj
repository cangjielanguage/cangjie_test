// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A{
    let a : Int32
    operator func +(inputB:A):Int32{
        return 0
    }
    init(a:Int32){
        this.a = a
    }
}

class B <: A{
    override operator func +(inputB:A):Int32{ // EXPECTED: regex modifiers 'override' and 'operator' are conflict in function declaration
        return 0
    }
    init(a:Int32){
        super.a = a
    }
}


func main():Int64{
    var a = B(1)
    var b = B(-1)
    return (a+b)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
