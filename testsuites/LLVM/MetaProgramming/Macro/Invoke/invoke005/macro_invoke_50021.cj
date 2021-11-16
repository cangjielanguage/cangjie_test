// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %compiler %cmp_opt %macro_lib_opt %f -o %output


import test.*

func main(){
    var a = 1
    var b = 0
    @M(a) = b // EXPECTED: regex illegal left value
    return 1
}
