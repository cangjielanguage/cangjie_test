// EXEC: %compiler -config="(test=true)" %cmp_opt %f %pic_opt

import ast.*

external macro when(a:Tokens){a}
external macro when(a:Tokens,b:Tokens){a}
@when[test=="true"]
func main(){0}
