package pkgb
import pkga.*

external func boo():Int64{
    var b0: Int64 = 2
    var b: Fruit<Int64> = Fruit<Int64>(b0)
    var v1: Int64 = 2
    var v2: Int64 = 2
    if (pkga.a.addcolor(v2) != 2){  // DTS20201104069EGVP0G00
        return 1
    }
    if (addcolor(pkga.a,v2) != 2){
        return 1
    }
    if (addcolor(b,v2) != 2){
        return 1
    }
    if (b.addcolor(v2) != 2){ // DTS20201104069EGVP0G00
        return 1
    }
    return 0
}

