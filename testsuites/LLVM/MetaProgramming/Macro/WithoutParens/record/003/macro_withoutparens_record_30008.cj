// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

@M
record A{
    static init(){} // EXPECTED: regex 'static' modifier is illegal for constructor in record body
}


func main(){
    A()
    return 0
}