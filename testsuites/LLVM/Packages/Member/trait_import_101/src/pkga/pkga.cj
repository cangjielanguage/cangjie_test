package pkga

external trait Num {
    func Data(a: This, b: Int64): This
}

append Int64 with Num{
    func Data(a:Int64,b:Int64):Int64{
        return a*2
    }
}