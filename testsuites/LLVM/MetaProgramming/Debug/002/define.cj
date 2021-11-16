package define

import ast.*

external macro SAME(a:Tokens){
    return a
}

external macro INT(a:Tokens){
    return quote(0)
}

external macro BOOL(a:Tokens){
    return quote(true)
}

external macro LIST(a:Tokens){
    return quote([1])
}


external macro ERROR(a:Tokens){
    return quote(func a():Int64{true})
}