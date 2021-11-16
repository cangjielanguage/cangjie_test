// DEPENDENCE: tcl
// EXEC: %compiler %cmp_opt -c tcl/*.cj -o tcl.%middle
// EXEC: %compiler %cmp_opt tcl.%middle %f
// EXEC: ./%n
//// EXEC: %run %run_opt %n %run_args

import tcl.*

// cjc  -backend-options="-fPIC --shared" com/*.cj -o libcom.so
// cjc  -backend-options="-lcom -L./" test_com.cj

func main(){
    hi()
    return 0
}