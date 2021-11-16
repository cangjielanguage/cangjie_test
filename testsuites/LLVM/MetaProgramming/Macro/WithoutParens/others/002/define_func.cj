

package define_func

from ast import ast.*

external macro M(input:Tokens){
    return quote(func test(){0})
}