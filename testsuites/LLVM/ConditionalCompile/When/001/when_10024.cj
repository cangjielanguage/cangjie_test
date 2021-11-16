// EXEC: %compiler -config="(test=true)" %cmp_opt %f %pic_opt

package test

@when[test=="true"]
from ast import ast.*

@when[test=="true"]
external macro M(a:Tokens){a}

@when[test=="true"]
func main(){
    return 0
}