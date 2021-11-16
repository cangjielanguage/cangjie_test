// EXEC: %compiler %cmp_opt %f %enable_macro %pic_opt

package define

from ast import ast.*

external macro test(attr:Tokens){
    quote(0)
}

external macro test(attr:Tokens,input:Tokens){
    quote(1)
}
