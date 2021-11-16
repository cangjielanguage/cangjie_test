package test

external var a = { input:Int64 => input}

external let b = { input:Int64 => input}

external let c = { input:(Int64)->Int64 => input(1)}