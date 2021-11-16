// DEPENDENCE: define_external.cj main_30002.cj
// EXEC: %compiler %cmp_opt define_external.cj %pic_opt
// EXEC: %compiler %cmp_opt %f ./define.%middle -c -backend-options="-fPIC" -o  %n.%middle
// EXEC: %compiler %cmp_opt main_30002.cj %n.%middle ./define.%middle %use_ast -o %output
// EXEC: %run %run_opt %output %run_args

package define
import define_external.*

@M
func test(){0}

