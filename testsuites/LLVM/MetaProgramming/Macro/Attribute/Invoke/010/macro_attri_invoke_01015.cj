// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro define.*


foreign { // ASSERT: scan unexpected class declaration
@M[var i : Int64 = 1]
record R{}

@M[var j : Int64 = 1]
class C{}
}

func main(){
    return 0
}

