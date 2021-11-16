// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro test.*

func main(){
    .@M[None](<Int64>) // EXPECTED: regex expected identifier before '.'
    .@M[Some](<Int64>(1)) // EXPECTED: regex expected identifier before '.'
    return 0
}
