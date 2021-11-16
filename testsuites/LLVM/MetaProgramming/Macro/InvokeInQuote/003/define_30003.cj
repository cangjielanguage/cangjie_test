package define_30003

import ast.*

external macro A(input:Tokens){
    return quote(1+1)
}

external macro B(attr:Tokens,input:Tokens){
    return quote(1+1)
}
