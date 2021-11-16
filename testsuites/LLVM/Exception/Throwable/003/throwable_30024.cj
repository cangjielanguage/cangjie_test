// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex bar|An exception has already occurred

class A<T> <: Throwable{}

func foo<T>(){
    func bar(){
        throw A<Throwable>()
    }
    bar()
}

func main() {
    foo<Int64>()
    return 5
}
