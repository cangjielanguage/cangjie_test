// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan expected ']' in the end of

import macro test.*

interface A{
    let a = @M["a](b")
}

func main(){
    return 0
}
