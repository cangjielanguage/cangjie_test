// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<T>{}

interface B<T> {}

interface C {}

interface D <: A<Int32> & B<Int32> & C{}

func main(){
    return 0
}