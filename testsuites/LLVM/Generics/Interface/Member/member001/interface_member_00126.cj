// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I<X>{
func t<X,Y>(){} // EXPECTED: regex error.*non-static generic member function 't' is not supported
}

class A <: I<Int32> {
var a :Int32 = 1
var b = t<Int32,Int64>()
}

func main(){
A()
return 0
}
