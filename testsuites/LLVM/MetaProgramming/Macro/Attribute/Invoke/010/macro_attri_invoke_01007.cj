// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro define.*


record A{
@M[var a : Int64 = 1] // EXPECTED: regex can only define variable and function inside a record
class C{}

@M[var b : Int64 = 1]
record R{}
}

func main(){
    return 0
}

