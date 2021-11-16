// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<T> {
    static func foo<T>(a:T):T{
        return a
    }
}
class Test<T> <: I<T> {}

func main(){
    Test<Int32>.foo(Int32(1))
    return 0
}
