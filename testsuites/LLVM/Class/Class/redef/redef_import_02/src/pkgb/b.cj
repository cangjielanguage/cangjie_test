package pkgb
import pkga.Boo

external class Coo <: Boo<Int32>{
    redef static func foo<V>(x:Int32,y:V) {
        return y
    }
}