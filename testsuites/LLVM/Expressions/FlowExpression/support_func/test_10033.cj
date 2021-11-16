package test

external func a(input:Int64):Int64{input}

external func b(input:Int64):Int64{input}

external func c(input:(Int64)->Int64):Int64{input(1)}