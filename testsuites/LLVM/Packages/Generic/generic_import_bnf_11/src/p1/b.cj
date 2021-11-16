package p1

external func goo<T>(a:T): T {
    return foo<T>(a)
}
