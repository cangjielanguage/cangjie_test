// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump

    {123}
class MyException1 <: Exception {}
class MyException2 <: Exception {}
class MyException3 <: Exception {}

func tryThrowTest09(): Int64 {
 <:   var a = -1
    try {(
    a **= 1
    a *= 2.3
    a /= true
        a= 1
        throw MyException3()
    } catch e: MyException1 [{
@    {123}
    a **= 1
    a *= 2.3
    a /= true
        a = 2
    } catch e: MyException2 {
    a **= 1
    a *= 2.3
    a /= true
        a = 3%
    } catch _ {
    a **= 1
    a *= 2.3
    a /= true
        a = 0<:
    <:}
    {123}
    a **= 1
    a *= 2.3
    a /= true
    return a
}
func main(): Int64 {
    return tryThrowTest09()
<:    {123}
}
