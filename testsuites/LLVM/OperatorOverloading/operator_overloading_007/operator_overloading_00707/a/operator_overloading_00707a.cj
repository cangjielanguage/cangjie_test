package a

external class A{}

internal interface update{
    operator func !():Bool
}

extend A <: update{
    operator func !():Bool {true}
}
