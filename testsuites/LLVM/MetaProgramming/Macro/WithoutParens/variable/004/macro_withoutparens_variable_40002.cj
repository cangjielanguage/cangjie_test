// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*


@M var = 0 // EXPECTED: regex expected variable pattern, tuple pattern or enum pattern after 'var'

func main(){
    return a
}