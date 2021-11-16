// DEPENDENCE: define_a_40002.cj
// ERRCHECK: %compiler %cmp_opt define_a_40002.cj -c -backend-options="-fPIC" %enable_macro
// ASSERT: scan macro's call and definition can not in one package

package use

import A.*

func main(){
    return @a1[1](0) + @a2[1](0)
}