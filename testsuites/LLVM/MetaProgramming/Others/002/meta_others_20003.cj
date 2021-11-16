// ERRCHECK: %compiler %cmp_opt %f %pic_opt

package define
from ast import ast.*

external macro M(input:Tokens){
    return quote(1)
}

external macro M(input:Tokens){ // EXPECTED: regex redefinition of macro 'M'
    return quote(0)
}


