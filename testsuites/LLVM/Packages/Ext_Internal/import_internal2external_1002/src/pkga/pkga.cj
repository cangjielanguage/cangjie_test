package pkga

external class A {}
external func C2<T>():Int32{1}
external func B<T>():Int32{
     return C2<Int32>() + C2<T>()
}
