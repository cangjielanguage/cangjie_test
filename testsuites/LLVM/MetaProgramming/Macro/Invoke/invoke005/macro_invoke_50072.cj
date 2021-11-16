// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*

enum E<T>{e(T)}

func main(){
    e<Int64>@M((1)) // EXPECTED: regex expected newline or ';' between expression or declaration
    return 0
}
