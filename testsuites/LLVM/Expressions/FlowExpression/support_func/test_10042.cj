package test

external class A{
    public func a(input:Int64):Int64{input}

    public func b(input:Int64):Int64{input}

    public func c(input:(Int64)->Int64):Int64{input(1)}
}