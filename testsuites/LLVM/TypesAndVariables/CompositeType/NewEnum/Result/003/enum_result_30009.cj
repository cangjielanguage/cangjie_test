// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan no matching enum constructor 'Err' for given arguments

class A<:Exception{}
var a : Result<Bool> = Err(A())
func test(x!:Bool= a!):Result<Bool>{Ok(x)}

func main(): Int64 {
    test()
    0
}
