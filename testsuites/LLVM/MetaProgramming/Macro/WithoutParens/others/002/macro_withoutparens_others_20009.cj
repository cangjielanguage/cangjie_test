// DEPENDENCE: define_class.cj
// EXEC: %compiler %cmp_opt define_class.cj %enable_macro %pic_opt
// EXEC: %compiler %cmp_opt %use_ast %f ./%llvm_attach/define.o -o %output
// EXEC: %run %run_opt %output %run_args

import define_class.*

@M
func test(){}

func main(){
    return A().a
}