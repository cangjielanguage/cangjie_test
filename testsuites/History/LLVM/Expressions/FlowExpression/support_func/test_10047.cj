package test

external trait X<T>{
    func a(x:T):T
    func b(x:T):T
    func c(x:(T)->T):T
}

append Bool with X<Int64>{
    func a(x:Int64):Int64{x}
    func b(x:Int64):Int64{x}
    func c(x:(Int64)->Int64):Int64{x(1)}
}