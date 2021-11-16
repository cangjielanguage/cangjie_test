// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output


import macro test.*

func main(){
    None<@M[Int64](0)> // EXPECTED: regex-auto illegal compare operation
    return 0
}
