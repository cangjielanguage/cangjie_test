// DEPENDENCE:  macro_define_07353.cj
// EXEC: %compiler %cmp_opt macro_define_07353.cj %pic_opt
// EXEC: %run %compiler %cmp_opt %macro_lib_opt %f  -o %output
// NOTEXEC: Do not need run. Just macro expand.

import test.*

@M
func dummy_func(){}

