package pkga

external trait Color {
    func addcolor(a: This,b:Int64):This
}

append String with Color {
    func addcolor(a: String,b:Int64): String {
        return a+b.toString()
    }
}

external var a:String = "a"