// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*


func main(){
    var @M(a) = 1 // EXPECTED: regex expected variable pattern, tuple pattern or enum pattern after 'var'
    return a-1
}
