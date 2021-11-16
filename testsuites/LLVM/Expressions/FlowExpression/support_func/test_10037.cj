package test

external interface A{
    let a = { input:Int64 => input}

    let b = { input:Int64 => input}

    let c = { input:(Int64)->Int64 => input(1)}
}