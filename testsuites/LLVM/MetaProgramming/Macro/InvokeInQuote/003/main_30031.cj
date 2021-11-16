package test

import use.*
import ast.*

func main(){
    var x = {=>quote(@X[0](0))}
    x().dump()
    @X[0](0) - 2
}