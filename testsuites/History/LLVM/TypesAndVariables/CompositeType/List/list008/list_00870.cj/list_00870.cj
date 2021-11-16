// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{}
interface I<T>{}

class IC<T> <: I<T>{}

record R<T>{}
enum E<T>{e}
func foo<T>(){}
trait update<T>{}

append<T> Int64 with update<List<T>>{}

func test<T>(input: I<List<T>>){
    C<List<T>>()
    R<List<T>>()
    foo<List<T>>()
    E<List<T>>.e
    return 0
}

func main(): Int64 {
    test<Int64>(IC<List<Int64>>())
    return 0
}
