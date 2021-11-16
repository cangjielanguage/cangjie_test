package pkga
import pkgb.*

external class Fruit<T>  {
  var name : T
  init(x:T) {
    name = x
  }
}

var a0: Int64 = 1
external var a:Fruit<Int64> = Fruit<Int64>(a0)

external func aoo():Int64{
    var b0: Int64 = 2
    var b: Fruit<Int64> = Fruit<Int64>(b0)
    var v1: Int64 = 2
    var v2: Int64 = 2
//    if (a.addcolor(v2) != 2){
//        return 1
//    }
    if (addcolor(a,v2) != 2){
        return 1
    }
    if (addcolor(pkgb.b,v2) != 2){
        return 1
    }
//    if (pkgb.b.addcolor(v2) != 2){
//        return 1
//    }
    return 0
}

