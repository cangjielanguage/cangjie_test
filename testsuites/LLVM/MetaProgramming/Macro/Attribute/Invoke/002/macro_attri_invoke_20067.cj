// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro define.*

func main(){
    return @M[\\](\\) // EXPECTED: regex-auto illegal symbol '\'
}

