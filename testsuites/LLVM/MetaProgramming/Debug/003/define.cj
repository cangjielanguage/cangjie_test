package define

import ast.*


external macro SAME(a:Tokens){
    return a
}

external macro ERROR(a:Tokens){
    return quote(func test():Int64{true})
}

external macro FUN(a:Tokens){
    return quote(func test():Int64{1})
}

