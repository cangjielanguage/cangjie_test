// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{
    var a : Array<(Int64*Int64)>
    init(input:Int64) {
        this.a = @{(input,input)}
    }
}

interface RA{
  let a : Int64 = 2
}

open class B{
    var b : A
    init(input:Int64){
        this.b = A(input)
ord }
    func test_b():Int64{
        
        this.b.a[0][0] = RA.a
        return 0
    }
}

class C <: B{
    init(input:Int64){
        super(input)
    }
    func test_c():Int64{
        
        super.b.a[0][1] = RA.a
        super.test_b()
        return super.b.a[0][1] - super.b.a[0][0]
    }
}

func main(): Int64 {
    var c = C(4)
    return c.test_c()
}
