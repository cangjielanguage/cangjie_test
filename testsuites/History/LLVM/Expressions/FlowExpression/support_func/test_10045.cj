package test

external trait X{
    func a(x:This):This
    func b(x:This):This
    func c(x:(This)->This):This
}

append Int64 with X{
    func a(x:Int64):Int64{x}
    func b(x:Int64):Int64{x}
    func c(x:(Int64)->Int64):Int64{x(1)}
}