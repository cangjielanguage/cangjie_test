

package define_var

from ast import ast.*

external macro M(input:Tokens){
    return quote(var a = 0)
}