// DEPENDENCE: define_record.cj
// EXEC: %compiler %cmp_opt define_record.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output

import define_record.*

record A{}
@M[x]  // EXPECTED: regex redefinition of declaration 'A'
record B{}

func main(){
    return 0
}