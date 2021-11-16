// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external interface A{
    func foo1():Bool
    func foo2(){0}
}

external class B <: A{
    func foo1(){
        return true
    }
}

func main(): Int64 {
   if(B().foo1()){
    return B().foo2()
   }
   return 1
}
