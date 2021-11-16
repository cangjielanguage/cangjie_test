package define_20013

import ast.*

external macro X(attr:Tokens,input:Tokens){
    print("x\n")
    return attr + quote(-) + input
}

external macro Y(attr:Tokens,input:Tokens){
    print("y\n")
    return attr + quote(+) + input
}