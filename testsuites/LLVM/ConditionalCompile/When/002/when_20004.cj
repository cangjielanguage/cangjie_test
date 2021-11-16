// DEPENDENCE: test_20004.cj
// EXEC: %compiler %cmp_opt test_20004.cj %pic_opt
// ERRCHECK: %compiler -config="(test=true)" %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan conditional compilation should have condition expression

import test.*

@when
func test(){0}

@when[test=="true"]
func main(){test()}
