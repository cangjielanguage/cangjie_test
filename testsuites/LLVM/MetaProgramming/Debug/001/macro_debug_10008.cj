// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args

package use

import define.*


@M1 enum E1{
    e
}

@M2[1] enum E2{
    e
}

func main(){0}