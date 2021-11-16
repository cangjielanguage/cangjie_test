// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

trait update{
    operator func [](a:This,b:Bool):Bool

}

append<T> Int8 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Int8,b:Bool):Bool {true}
}
append<T> Int16 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Int16,b:Bool):Bool {true}
}
append<T> Int32 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Int32,b:Bool):Bool {true}
}
append<T> Int64 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Int64,b:Bool):Bool {true}
}
append<T> UInt8 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:UInt8,b:Bool):Bool {true}
}
append<T> UInt16 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:UInt16,b:Bool):Bool {true}
}
append<T> UInt32 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:UInt32,b:Bool):Bool {true}
}
append<T> UInt64 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:UInt64,b:Bool):Bool {true}
}
append<T> Float16 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Float16,b:Bool):Bool {true}
}
append<T> Float32 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Float32,b:Bool):Bool {true}
}
append<T> Float64 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Float64,b:Bool):Bool {true}
}
append<T> Unit with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Unit,b:Bool):Bool {true}
}
append<T> Bool with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Bool,b:Bool):Bool {true}
}
append<T> Char with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Char,b:Bool):Bool {true}
}
append<T> String with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:String,b:Bool):Bool {true}
}
append<T> Array<Int32> with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Array<Int32>,b:Bool):Bool {true}
}
append<T> Int32*Int32 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:Int32*Int32,b:Bool):Bool {true}
}
append<T> (Int32)->Int32 with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:(Int32)->Int32,b:Bool):Bool {true}
}
record A{}
class B{}
interface C{}
enum D{d}
append<T> A with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:A,b:Bool):Bool {true}
}
append<T> B with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:B,b:Bool):Bool {true}
}
append<T> C with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:C,b:Bool):Bool {true}
}
append<T> D with update { // EXPECTED: regex All type parameters must appear at least once in appendType or trait
    operator func [](a:D,b:Bool):Bool {true}
}
func main(): Int64 {
    return 1
}
