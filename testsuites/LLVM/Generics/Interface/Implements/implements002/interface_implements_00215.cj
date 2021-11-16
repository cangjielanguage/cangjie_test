// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}
class Child <: Father{}

interface J{
func foo(a:Int16):Child
}

external class B <: J{
func foo(a:Int16):Father{return Child()} // EXPECTED: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function
}


func main(){
return 0
}
