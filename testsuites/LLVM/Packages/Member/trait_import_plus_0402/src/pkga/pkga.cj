package pkga

external trait Color {
    func addcolor(a: This,b:Int64):Int64
}

external var a:Fruit = Fruit(1)

append Fruit with Color {
    func addcolor(a: Fruit,b:Int64): Int64 {
        return a.name + b
    }
}

external class Fruit  {
  var name : Int64
  init(x:Int64) {
    name = x
  }
}