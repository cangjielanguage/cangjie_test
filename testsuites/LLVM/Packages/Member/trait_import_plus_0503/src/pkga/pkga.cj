package pkga

external class Fruit<T>  {
  var name : T
  init(x:T) {
    name = x
  }
}

var a0: Int64 = 1
external var a:Fruit<Int64> = Fruit<Int64>(a0)