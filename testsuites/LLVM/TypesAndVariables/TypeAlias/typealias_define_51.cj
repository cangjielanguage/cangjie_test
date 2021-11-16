// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface InterfaceA<T> {
    static func foo(x: T){ return x }
}

type IA<T> = InterfaceA<T>

func main(): Int64 {
    if (IA<Int32>.foo(2) == 2) {
        return 0
    }
    return 1
}