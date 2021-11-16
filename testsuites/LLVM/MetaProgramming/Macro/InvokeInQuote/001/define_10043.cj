package define_10043

import ast.*

external macro Y(input:Tokens){
    return quote(1+1)
}

external macro X(input:Tokens){
    print("oh\n")
    return quote(var x : Int64)
}
