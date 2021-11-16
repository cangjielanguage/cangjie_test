package B

import A.*
from ast import ast.*

external macro b(x:Tokens, y:Tokens){
    @a1[0](1)
    @a2[0](1)
    quote(0)
}