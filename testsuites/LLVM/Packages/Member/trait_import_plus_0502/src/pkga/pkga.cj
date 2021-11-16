package pkga

external trait Color<T> {
    func addcolor(a: This,b:T):T
}

var a0: Int64 = 1
external var a:Fruit<Int64> = Fruit<Int64>(a0)

append<V1,V2> Fruit<V1> with Color<V2> {
    func addcolor(a: Fruit<V1>,b:V2): V2 {
        return b
    }
}

external class Fruit<T>  {
  var name : T
  init(x:T) {
    name = x
  }
}