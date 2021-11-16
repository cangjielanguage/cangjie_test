// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex abstract generic function is not allowed in interface

interface I<X>{
    func t<X,Y>(a:X):Y
}

class A <: I<Int32> {
}

func main(){
A()
return 0
}
