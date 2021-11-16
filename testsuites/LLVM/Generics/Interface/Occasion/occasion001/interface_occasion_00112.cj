// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<T> {
    static func foo<X>(a:X):X{
        return a
    }
}

class Test<T> <: I<T> {}

func main(){
    if (Test<Int64>.foo<Int32>(Int32(1)) != Int32(1)) {
        return 1
    }
    return 0
}