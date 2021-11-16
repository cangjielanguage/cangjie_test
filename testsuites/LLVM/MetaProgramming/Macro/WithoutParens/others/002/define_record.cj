

package define_record

from ast import ast.*

external macro M(input:Tokens){
    return quote(record A{var a : Int64 = 0})
}