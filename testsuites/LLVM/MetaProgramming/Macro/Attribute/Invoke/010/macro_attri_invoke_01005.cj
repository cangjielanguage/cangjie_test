// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro define.*


class A{
@M
class C{}

@M
record R{} // EXPECTED: regex-auto illegal class member in class block
}

func main(){
    return 0
}

