// EXEC: %compiler %cmp_opt %f -o %output 2>&1| compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
class A{
    var a : Array<(Int32*Int32)>
    init(input:Int32) {
        this.a = @{(input,input)}
    }
}

open class B{
    var b : A
    init(input:Int32){
        this.b = A(input)
    }
    func test_b():Int32{
        this.b.a[0][0]++    // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
        if (this.b.a[0][0] != Int32(5)) {
            return 1
        }
        this.b.a[0][0]--    // EXPECTED: regex 'tuple access' is unsupported for this increment or decrement expression
        if (this.b.a[0][0] != Int32(4)) {
            return 2
        }
        return 0
    }
}

class C <: B{
    init(input:Int32){
        super(input)
    }
    func test_c():Int32{
        super.b.a[0][1]++
        if (this.b.a[0][1] != Int32(5)) {
            return 1
        }
        this.b.a[0][1]--
        if (this.b.a[0][1] != Int32(4)) {
            return 2
        }
        return super.test_b()
    }
}

func main(): Int64 {
    var c = C(4)
    return c.test_c()
}
