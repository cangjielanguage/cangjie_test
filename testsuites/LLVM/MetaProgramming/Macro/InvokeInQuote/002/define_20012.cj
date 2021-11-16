package define_20012

import ast.*

external macro X(attr:Tokens,input:Tokens){
    return attr + quote(-) + input
}

external macro Y(input:Tokens){
    return input + quote(+) + input
}