// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro define.*


interface A{
@M[let a : Int64 = 1]
class C{}

@M[let b : Int64 = 1]
record R{} // EXPECTED: regex-auto illegal interface member in interface block
}

func main(){
    return 0
}

