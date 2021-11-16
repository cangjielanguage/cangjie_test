// DEPENDENCE: define_record.cj
// EXEC: %compiler %cmp_opt define_record.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_record.*

@M[x]
record A{
    static init(){} // EXPECTED: regex 'static' modifier is illegal for constructor in record body
}


func main(){
    A()
    return 0
}