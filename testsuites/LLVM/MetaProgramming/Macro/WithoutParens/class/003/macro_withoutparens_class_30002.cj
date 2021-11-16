// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

@M class A{}

class B <: A{} // EXPECTED: regex super class 'A' is not inheritable, use 'open' modifier instead

func main(){
    return 0
}