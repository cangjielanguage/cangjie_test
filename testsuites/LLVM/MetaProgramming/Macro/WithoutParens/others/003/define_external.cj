

package define_external

from ast import ast.*

external macro M(input:Tokens){
    return quote(external) + input
}