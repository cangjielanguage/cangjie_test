// DEPENDENCE: define_func.cj
// EXEC: %compiler %cmp_opt define_func.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import define_func.*

@M[x]
func (){} // EXPECTED: regex expected function name after 'func'

func main(){
    return 0
}

