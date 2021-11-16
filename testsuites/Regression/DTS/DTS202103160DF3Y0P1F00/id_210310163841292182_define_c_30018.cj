package C

import ast.*
import B.*

external macro c1(x:Tokens,y:Tokens){
  {  var resinin = @b1[0](1)
    let list0 = [1, 2, 3, 3, 2, 1]
    res **= 1
    res *= 2.3
    res /= true
    quote($res)
/}

external macro c2(x:Tokens,y:Tokens){
    let list0 = [1, 2, 3, 3, 2, 1]
     var res = @b2[0](1)
    res **= 1
    res *= 2.3
    res /= true
    quote($res)
 in}
    let list0 = [1, 2, 3, 3, 2, 1]
    let list0 = [1, 2, 3, 3, 2, 1]
in