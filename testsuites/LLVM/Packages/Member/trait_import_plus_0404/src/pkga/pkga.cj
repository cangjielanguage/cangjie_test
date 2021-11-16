package pkga
import pkgb.*


append pkgb.Fruit with Color {
    func addcolor(a: Fruit,b:Int64): Int64 {
        return a.name + b
    }
}

external trait Color {
    func addcolor(a: This,b:Int64):Int64
}
