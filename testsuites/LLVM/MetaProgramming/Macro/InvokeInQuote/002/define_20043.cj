package define_20043

import ast.*

external macro X(attr:Tokens,input:Tokens){
    print("oh!\n")
    return quote(1-1)
}

external macro Y(input:Tokens){
    return input
}