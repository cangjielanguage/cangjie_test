// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A<T> <: Throwable{}

func test<T>(){throw A<T>()}

func main() {
    try{
        test<Int64>();
        ()
    } catch (a:A<Int64>) {
        print("success")
    }
    return 0
}
