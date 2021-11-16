// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan illegal macro expand input args
// not macro named Bvar.

import macro define.*

func main(){
    2 - @B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@B@Bvar x = 1
}
