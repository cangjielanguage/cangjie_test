package pkga

external class Fruit  {
  var name : Int64
  init(x:Int64) {
    name = x
  }
}

external var a:Fruit = Fruit(1)