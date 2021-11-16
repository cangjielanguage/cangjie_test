package pkga
import pkgb.*

external class Fruit  {
  var name : Int64
  init(x:Int64) {
    name = x
  }
}

var a0: Int64 = 1
external var a:Fruit = Fruit(a0)

append Fruit with Color {
    func addcolor(a: Fruit,b:Int64): Int64 {
        return a.name + b
    }
}