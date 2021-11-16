package a

external class A<T>{
    operator func *(b:A<T>):Bool  {true}
}

external record B<T>{
    operator func *(b:B<T>):Bool  {true}
}

external interface C<T>{
    operator func *(b:C<T>):Bool  {true}
}

external class D<T> <: C<T>{}