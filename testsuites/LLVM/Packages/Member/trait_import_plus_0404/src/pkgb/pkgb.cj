package pkgb
import pkga.*


external class Fruit  {
  var name : Int64
  init(x:Int64) {
    name = x
  }
}

var a0: Int64 = 1
var a:Fruit = Fruit(a0)

external func boo():Int64{
    var b0: Int64 = 1
    var b: Fruit = Fruit(b0)
    var v1: Int64 = 1
    var v2: Int64 = 1
    if (a.addcolor(v2) != 2){
        return 1
    }
    if (addcolor(a,v2) != 2){
        return 1
    }
    if (addcolor(b,v2) != 2){
        return 1
    }
    if (b.addcolor(v2) != 2){
        return 1
    }
    return 0
}

