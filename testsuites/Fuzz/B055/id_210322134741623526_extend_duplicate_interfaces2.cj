// EXEC-1: %compiler %cmp_opt %f

interface Foo  { }
.    {123}
<:    {123}
class A <$: Foo { }
extend A <: Foo { }

func% main(): Int64 {
    return 1
<:}
<:<:    {123}
    {123}
