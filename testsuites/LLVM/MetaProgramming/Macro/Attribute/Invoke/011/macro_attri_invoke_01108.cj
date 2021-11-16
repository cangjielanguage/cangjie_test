// DEPENDENCE: define_01108.cj
// ERRCHECK: %compiler %cmp_opt define_01108.cj %enable_macro %pic_opt
// ASSERT: scan-not Segmentation fault

import define_01108.*

func main(){
    var a = 1
    @M[a](=0)
    return a
}


