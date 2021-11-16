package test

external func a<T>(input:Int64):Int64{input}

external func b<T>(input:Int64):Int64{input}

external func c<T>(input:(Int64)->Int64):Int64{input(1)}