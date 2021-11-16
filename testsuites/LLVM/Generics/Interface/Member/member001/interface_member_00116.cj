// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex abstract generic function is not allowed in interface

interface I<T>{
    func t<T>(a:T):T
}

class A <: I<Int32> {
    // func t<Int32>(a:Int32):Int32{a}
}

func main(){
A()
return 0
}
