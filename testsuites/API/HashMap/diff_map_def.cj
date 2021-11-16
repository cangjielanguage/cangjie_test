// EXEC-PIPE-1: %compiler %stdx_cmp_opt %enableAD %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex function foo failed the differentiability check

from std import collection.*
@differentiable
func foo(x: HashMap<Int64,Int64>){
    return x
}

func main():Int64{
        return 0
}
