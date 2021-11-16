package B

import A.*
from ast import ast.*

external macro b1(x:Tokens, y:Tokens){
    @a1[0](1)
    @a2[0](1)
    @a3[0](1)
    @a4[0](1)
    @a5[0](1)
    quote(0)
}