// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*

enum E<T>{e(T)}

func main(){
    @M(E)<Int64>.e(1) // EXPECTED: regex expected expression here
    return 0
}
