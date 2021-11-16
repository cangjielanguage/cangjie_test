package pkgb
import pkga.*


external trait Color {
    func addcolor(a: This,b:Int64):Int64
}

external func boo():Int64{
    var b0: Int64 = 1
    var b: pkga.Fruit = pkga.Fruit(b0)
    var v1: Int64 = 1
    var v2: Int64 = 1
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

