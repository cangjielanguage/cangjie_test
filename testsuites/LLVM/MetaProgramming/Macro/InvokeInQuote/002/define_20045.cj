package define_20045

import ast.*

var count = 1

external macro X(attr:Tokens,input:Tokens){
    print("count is ${count}!\n")
    count = count + 1
    return quote(1-1)
}

external macro Y(input:Tokens){
    return input
}