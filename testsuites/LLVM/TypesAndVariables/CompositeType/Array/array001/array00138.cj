// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}

class B <: A{}

class C <: A{}

func main(): Int64 {
    var b = B()
    var c = C()
    let myArray : Array<A> = @{b,c,A()}
    return 0
}
