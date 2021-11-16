
package ddd
import eee.foo

external func goo(x:Int32){
    return 10
}

external func goo(x:Int64){
    return 20
}

external func goo(x:Int64,y:String){
    return 30
}

internal func goo(x:Int64,y:Char){
    return 40
}