package test

import use.*
import ast.*

func main(){
    var x = {=>@X[0](0)}
    x()
    @X[0](0) - 2
}