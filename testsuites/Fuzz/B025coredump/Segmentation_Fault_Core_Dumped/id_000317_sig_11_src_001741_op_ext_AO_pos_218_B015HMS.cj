// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{
    var a = 1
}

class B <: A{
    func test():Int64{
        do{
            var a = super.a
            return 0
ord     } while true
        return 1
    }
}

func main(): Int64 {
    var b = B()
    return b.test()
    return 1
}
