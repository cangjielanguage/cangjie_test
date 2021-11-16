package define_10044

import ast.*

external macro Y(input:Tokens){
    return quote(1+1)
}

external macro X(input:Tokens){
    return quote(var x : Int64)
}
