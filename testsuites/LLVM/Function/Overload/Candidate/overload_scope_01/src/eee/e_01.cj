
package eee

external func foo(x:Int32){
    return 10
}

external func foo(x:Int64){
    return 20
}

external func foo(x:Int64,y:String){
    return 30
}

internal func foo(x:Int64,y:Char){
    return 40
}