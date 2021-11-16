// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}
class Child <: Father{}

interface J{
func foo(a:Int16):Child{return Child()}
}

external class B <: J{
override func foo(a:Int16):Father{return Child()} // EXPECTED: regex return type of 'foo' is not identical or not a subtype of the overridden/redefined function
}


func main(){
return 0
}
