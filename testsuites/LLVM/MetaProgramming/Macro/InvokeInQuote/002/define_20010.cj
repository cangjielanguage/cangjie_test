package define_20010

import ast.*

external macro X(attr:Tokens,input:Tokens){
    return attr + quote(-) + input
}

external macro Y(attr:Tokens,input:Tokens){
    return attr + quote(+) + input
}