// DEPENDENCE: define_record.cj
// EXEC: %compiler %cmp_opt define_record.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define_record.*

@M[x]
record B<X>{
    init(input:Y){}
}


func main(){
    A()
    return 0
}