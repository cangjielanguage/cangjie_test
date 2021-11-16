package define_30013

import ast.*

external macro X(input:Tokens){
    return quote(1+1)
}

external macro X(attr:Tokens,input:Tokens){
    return quote(1+1)
}

external func x(){}
