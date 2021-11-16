// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I<X,Y>{
func t<X>(a:X,b:Y):Y{b} // EXPECTED: regex error.*non-static generic member function 't' is not supported
}

class A <: I<Int32 &Int32> {
var a :Int32 = 1
var b = t<Int32>(a,a)
}

func main(){
A()
return 0
}
