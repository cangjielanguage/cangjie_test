package pkga

external func Foo<T>(x:T):Int32 {
    let width: T = x
    return 2
}

let x0: Int32 = 1
external let x: Int32 = Foo<Int32>(x0)
