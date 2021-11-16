// DEPENDENCE: define_a_40006.cj define_aa_40006.cj
// ERRCHECK: %compiler %cmp_opt define_a_40006.cj define_aa_40006.cj -c -backend-options="-fPIC" %enable_macro
// ASSERT: scan macro's call and definition can not in one package

package use

import A.*

func main(){
    return 1
}