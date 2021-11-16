// DEPENDENCE: define_01109.cj
// ERRCHECK: %compiler %cmp_opt define_01109.cj %enable_macro %pic_opt
// ASSERT: scan-not Segmentation fault

import define_01109.*

func main(){
    var a = 1
    @x[a](=0)
    return a
}


