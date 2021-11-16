
package bbb

external var foo1 = {x:()->Int32=>return x()}

var a:Int32 = 1
external var foo2 = {x:()->Int32=>return x() + a}

var foo3 = {x:()->Int32=>return x()}
external var foo4 = {x:()->Int32=>return x() + foo3({3})}