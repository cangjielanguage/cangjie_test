// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external enum TimeUnit1 {
    Year | Month | Day | Hour
    static func foo(){0}
}

external record A{
    static var  a = TimeUnit1.Year
    static func foo2(){
        return TimeUnit1.foo
    }
}

extend A{
    func foo3(){
        return foo2
    }
}

external var cc = A.foo2
external var dd = A.a

func main(): Int64 {
   return cc()() + A().foo3()()() 
}
