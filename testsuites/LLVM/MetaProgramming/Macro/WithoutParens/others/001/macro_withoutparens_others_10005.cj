// DEPENDENCE: define.cj
// EXEC: echo "define=./define.cjo" >> define.conf
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import macro define.*

func main(){
    var a = @M var b = 1      // EXPECTED: regex invalid node expanded in macro call's father node
    return 1
}
