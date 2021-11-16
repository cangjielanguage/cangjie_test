package a

external class A {}

external interface update{
    operator func !():Bool
}

extend A <: update{
    operator func !():Bool {true}
}
