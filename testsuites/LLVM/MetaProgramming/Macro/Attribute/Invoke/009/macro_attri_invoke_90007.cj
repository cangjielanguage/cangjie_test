// DEPENDENCE: define_func.cj
// EXEC: %compiler %cmp_opt define_func.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import define_func.*

func a(){0}

@M[x] // EXPECTED: regex function 'a' has overload conflicts
func foo(){}

func main(){
    return 0
}

