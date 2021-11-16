package define_30008

import ast.*

external macro A(input:Tokens){
    return quote(1+1)
}

external macro B(attr:Tokens,input:Tokens){
    return quote(1+1)
}
