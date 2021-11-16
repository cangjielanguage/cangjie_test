package test

external class A<T>{
    var x : T
    init(input: T){
        x = input
    }
    public func a(input:T):T{x}

    public func b(input:T):T{x}

    //public func c(input:(T)->T):Int64{1}
}