// DEPENDENCE: define_01103.cj
// ERRCHECK: %compiler %cmp_opt define_01103.cj %enable_macro %pic_opt
// ASSERT: scan undeclared identifier 'M'
// ASSERT: scan-not Segmentation fault

import define_01103.*

func main(){
    var a = 1
    @M[a](=0)
    return a
}

