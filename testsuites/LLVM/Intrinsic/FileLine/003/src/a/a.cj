package a

external func foo(){var a = sourceFile();return a}
external func bar(){var b = sourceLine();return b}

external func foo_(x !: String = sourceFile()){return x}
external func bar_(x !: Int64 = sourceLine()){return x}

external var x : String = sourceFile()
external var y : Int64 = sourceLine()

