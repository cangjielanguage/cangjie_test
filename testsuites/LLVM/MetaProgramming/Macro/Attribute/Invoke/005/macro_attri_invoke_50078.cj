// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args


import macro test.*

enum E<T>{e(T)}

func main(){
    match (@M[E<Int64>.e](1)(0)) {
        case e(x) => x // x == 0
    }
}
