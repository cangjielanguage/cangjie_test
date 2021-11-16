package pkgb
import pkga.*


external trait Color {
    func addcolor(a: This,b:Int64):Int64
}

append Fruit with Color {
    func addcolor(a: Fruit,b:Int64): Int64 {
        return a.name + b
    }
}

external func boo():Int64{
    var b: Fruit = Fruit(2)
    var v1: Int64 = 2
    var v2: Int64 = 2
    if (pkga.a.addcolor(v2) != 3){
        return 1
    }
    if (addcolor(pkga.a,v2) != 3){
        return 1
    }
    if (addcolor(b,v2) != 4){
        return 1
    }
    if (b.addcolor(v2) != 4){
        return 1
    }
    return 0
}

