// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output


import test.*


func main(){
    var a = 1..@M(10:2) // EXPECTED: regex invalid use of operator ':'
    for (i in a) {
        print(i.toString())
    }
    return 0
}
