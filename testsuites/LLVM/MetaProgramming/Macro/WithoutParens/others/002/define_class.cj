

package define_class

from ast import ast.*

external macro M(input:Tokens){
    return quote(class A{var a : Int64 = 0})
}