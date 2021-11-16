// DEPENDENCE: define_01105.cj
// ERRCHECK: %compiler %cmp_opt define_01105.cj %enable_macro %pic_opt
// ASSERT: scan undeclared identifier 'X'
// ASSERT: scan undeclared identifier 'Y'
// ASSERT: scan-not Segmentation fault

import define_01105.*

func main(){
    var a = 2
    @Y[a](=1)
    @X(a=0)
    return a
}

