package pkgb
import pkga.*

external func foo(x:Int32):Int32 {
    var d:Data = Data(x)
    var a:Int32 = d.get()
    return a
}
