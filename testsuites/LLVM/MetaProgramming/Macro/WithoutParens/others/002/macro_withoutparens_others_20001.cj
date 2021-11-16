// DEPENDENCE: define_var.cj
// EXEC: %compiler %cmp_opt define_var.cj %enable_macro %pic_opt
// EXEC: %compiler %cmp_opt %use_ast %f ./%llvm_attach/define.o -o %output
// EXEC: %run %run_opt %output %run_args

import define_var.*

@M
func test(){}

func main(){
    return a
}