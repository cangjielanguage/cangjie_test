package define_30021

import ast.*

external macro B(input:Tokens){
    return quote(1+1)
}

external macro B(attr:Tokens,input:Tokens){
    return quote(1+1)
}


external func x(){}
