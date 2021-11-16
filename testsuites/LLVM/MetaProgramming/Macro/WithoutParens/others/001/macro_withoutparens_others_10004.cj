// DEPENDENCE: define.cj
// EXEC: echo "define=./define.cjo" >> define.conf
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

func main(){
    @M 1+1 // EXPECTED: regex illegal macro expand input args
    return 1
}
