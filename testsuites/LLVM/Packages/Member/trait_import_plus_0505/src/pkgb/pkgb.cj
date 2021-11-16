package pkgb
import pkga.*


external trait Color<T> {
    func addcolor(a: This,b:T):T
}

external func boo():Int64{
    var b0: Int64 = 2
    var b: pkga.Fruit<Int64> = pkga.Fruit<Int64>(b0)
    var v1: Int64 = 2
    var v2: Int64 = 2
//    if (pkga.a.addcolor(v2) != 2){
//        return 1
//    }
    if (addcolor(pkga.a,v2) != 2){
        return 1
    }
    if (addcolor(b,v2) != 2){
        return 1
    }
//    if (b.addcolor(v2) != 2){
//        return 1
//    }
    return 0
}

