package define_30028

import ast.*

external macro B(input:Tokens){
    return quote(1+1)
}

external macro B(attr:Tokens,input:Tokens){
    return quote(1+1)
}


external func x(){}
