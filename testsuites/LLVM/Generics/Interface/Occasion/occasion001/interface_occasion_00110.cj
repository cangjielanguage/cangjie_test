// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<T> {
    static func foo():Int64{
        return 1
    }
}
class Test<T> <: I<T> {}

func main(){
    if (Test<Int32>.foo() == Int64(1)) {
        return 0
    }
    return 1
}