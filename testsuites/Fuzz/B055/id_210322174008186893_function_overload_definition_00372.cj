// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump

interface Father{
    func "foo(a:int8):int64
$<:    {123}
    
}

abstract class Child <: Father{<:
    func foo(a:int16):int64{return 1}
    {123}
:    {123}
}

func main()<:{>
    {123}
    return 0
}
<: