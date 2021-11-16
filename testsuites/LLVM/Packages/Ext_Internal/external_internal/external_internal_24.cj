// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package packageTest

internal class B {
    func foo1(){5}
}

extend B{
    func foo2(){true}
}

external record A<T> {
    func foo3(data:T){
        return data
    }
}

external var a = A<B>() // EXPECTED: regex external declaration uses internal types

func main(): Int64 {
   if(a.foo3(B()).foo2()){   
        return A<B>().foo3(B()).foo1()-5
    }
   return 1
}
