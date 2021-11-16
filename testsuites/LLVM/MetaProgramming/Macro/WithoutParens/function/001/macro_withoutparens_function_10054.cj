// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

interface X<T>{
    @M operator func *(b:T):Int64
}

extend Char <: X<Char>{
    operator func *(b:Char):Int64{0}
}


func main(){
    return '1'*'2'
}