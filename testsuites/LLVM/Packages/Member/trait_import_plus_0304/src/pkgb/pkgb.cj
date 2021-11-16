package pkgb
import pkga.*

append String with Color {
    func addcolor(a: String,b:Int64): String {
        return a+b.toString()
    }
}

external func boo():Int64{
    var b: String = "b"
    var v1: String = "abc"
    var v2: Int64 = 123
    if (pkga.a.addcolor(v2) != "a123"){
        return 1
    }
    if (addcolor(pkga.a,v2) != "a123"){
        return 1
    }
    if (b.addcolor(v2) != "b123"){
        return 1
    }
    if (addcolor(v1,v2) != "abc123"){
        return 1
    }
    return 0
}

