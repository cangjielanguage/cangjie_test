package pkga

external trait Color {
    func addcolor(a: This,b:Int64):This
}

append Int64 with Color {
    func addcolor(a: Int64,b:Int64): Int64 {
        return a+b
    }
}

external var a:Int64 = 1