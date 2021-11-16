

package define

from ast import ast.*

external macro M(input:Tokens){
    return quote(class A{})
}