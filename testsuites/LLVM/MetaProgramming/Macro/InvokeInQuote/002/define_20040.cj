package define_20040

import ast.*

external macro X(attr:Tokens,input:Tokens){
    return quote(1-1)
}

external macro Y(input:Tokens){
    return input
}