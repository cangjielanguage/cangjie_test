// DEPENDENCE: define_01110.cj
// ERRCHECK: %compiler %cmp_opt define_01110.cj %enable_macro %pic_opt
// ASSERT: scan undeclared identifier 'M'
// ASSERT: scan-not Segmentation fault

import define_01110.*

func main(){
    var a = 1
    @M[a](=0)
    return a
}


