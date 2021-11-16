package pkgb
import pkga.*


external func boo():Int64{
    var b : Int64 = 2
    var v1: Int64 = 2
    var v2: Int64 = 2
    if (pkga.a.addcolor(v2) != 3){
        return 1
    }
    if (addcolor(pkga.a,v2) != 3){
        return 1
    }
    if (addcolor(v1,v2) != 4){
        return 1
    }
    if (v1.addcolor(v2) != 4){
        return 1
    }
    return 0
}

