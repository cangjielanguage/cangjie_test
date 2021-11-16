package test

external class A{
    static func a(input:Int64):Int64{input}

    static func b(input:Int64):Int64{input}

    static func c(input:(Int64)->Int64):Int64{input(1)}
}