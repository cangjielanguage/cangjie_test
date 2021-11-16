// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{}
interface I<T>{}
record R<T>{}
enum E<T>{e}
func foo<T>(){}
trait update<T>{}
append Int64 with update<List<Int64>>{}

func test(input:I<Int64>){}

func main(): Int64 {
    C<List<Int64>>()
    R<List<Int64>>()
    foo<List<Int64>>()
    E<List<Int64>>.e
    return 0
}
