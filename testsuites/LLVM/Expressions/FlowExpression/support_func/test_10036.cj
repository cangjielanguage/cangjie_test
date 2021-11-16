package test

external class A{
    static var a = { input:Int64 => input}

    static var b = { input:Int64 => input}

    static var c = { input:(Int64)->Int64 => input(1)}
}