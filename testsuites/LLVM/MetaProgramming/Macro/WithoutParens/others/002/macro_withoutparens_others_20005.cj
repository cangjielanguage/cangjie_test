// DEPENDENCE: define_func.cj
// EXEC: %compiler %cmp_opt define_func.cj %enable_macro %pic_opt
// EXEC: %compiler %cmp_opt %use_ast %f ./%llvm_attach/define.o -o %output
// EXEC: %run %run_opt %output %run_args

import define_func.*

@M
class A{}

func main(){
    return test()
}