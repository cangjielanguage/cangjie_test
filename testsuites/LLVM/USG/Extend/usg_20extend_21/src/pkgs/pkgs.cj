package A
external class Foo {}

internal interface I1 {
    func f(): Unit
}
/*
extend Foo <: I1 { // error
    func f(): Unit {}
}
*/

external interface I2 {
    func g(): Unit
}

extend Foo <: I2 { // ok
    func g(): Unit {}
}