// DEPENDENCE: define10028.cj
// EXEC: %compiler %cmp_opt define10028.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// ASSERT: scan-not Segmentation fault

package use

import define10028.*

func main(){
    return @M(\[) // EXPECTED: regex illegal macro expand input args
}