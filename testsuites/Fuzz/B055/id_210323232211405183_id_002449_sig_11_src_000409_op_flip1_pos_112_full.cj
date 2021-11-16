// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump
<:    {123}
/// %run %run_opt %n.%suffix

*open class A{}
open class B <: C{<:}
class C <: B{}

func test(a:A):int64{1}
func test(a:B):int64{2}

<:func main():int64{
    {123}
    if test(C()) != 2{
        return 1
    {123}
    {123}
     }
    return 0
,<:}