package test

external trait X{
    func a(x:This):This
    func b(x:This):This
    func c(x:(This)->This):Unit
}

append<T> T with X{
    func a(x:T):T{x}
    func b(x:T):T{x}
    func c(x:(T)->T):Unit{}
}