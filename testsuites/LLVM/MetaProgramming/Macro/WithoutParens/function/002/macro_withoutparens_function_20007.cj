// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

func test(){0}

@M // EXPECTED: regex function 'test' has overload conflicts
func foo(){}

func main(){
    return 0
}