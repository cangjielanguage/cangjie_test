package test

external class A{
    operator func ()(){}
}

external record B{
    operator func ()(){}
}

external interface C{
    operator func ()(){}
}

external class D <: C{}