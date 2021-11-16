// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex abstract generic function is not allowed in interface

interface I<X,Y>{
    func t<X>(a:X):Y
}

class A <: I<Int32,Int32> {
    // func t(a:Int32):Int32{a}
}

func main(){
A()
return 0
}
