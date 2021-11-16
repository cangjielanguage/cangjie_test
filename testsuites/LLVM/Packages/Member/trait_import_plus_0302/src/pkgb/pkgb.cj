package pkgb
import pkga.*


external func boo():Int64{
    var b : String = "b"
    var v1: String = "abc"
    var v2: Int64 = 123
    if (pkga.a.addcolor(v2) != "a123"){
        return 1
    }
    if (addcolor(pkga.a,v2) != "a123"){
        return 1
    }
    if (addcolor(v1,v2) != "abc123"){
        return 1
    }
    if (v1.addcolor(v2) != "abc123"){
        return 1
    }
    return 0
}

