package test

external func foo(x !: String = sourceFile()){return x}
external func bar(x !: Int64 = sourceLine()){return x}
