// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

@M
func (){ // EXPECTED: regex expected function name after 'func'
    return 0
}

func main(){
    return 0
}