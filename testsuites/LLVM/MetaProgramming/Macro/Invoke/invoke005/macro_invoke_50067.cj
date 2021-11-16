// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*

interface I{
    let i = 1
}

func main(){
    I.@M(i) // EXPECTED: regex expected identifier here
    return 0
}
