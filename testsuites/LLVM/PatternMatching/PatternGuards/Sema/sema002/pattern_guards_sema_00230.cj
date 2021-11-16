// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class A{
    var a : Int64 = 1
}

class B <: A{
    var i : Int64 = 1
    func test(){
        var y : Int64 = match (i) {
            case _ if (super.a) => i // EXPECTED: regex expected an expression of type 'Bool', but got
            }
        if (y == 1) {
            return 0
        }
        return 1
    }
}

func main(){
    var b : B = B()
    return  b.test()
}
