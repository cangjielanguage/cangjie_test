// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<X>{
    static func foo(a:X):X{a}
}

class Test<X> <: A<X>{}

func main(){
    if (Test<Int64>.foo(1) != 1) {
        return 1
    }
    return 0
}