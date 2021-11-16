package p1

external func aoo<T> (x:T) {
    func boo<V>(x:V){
        return x
    }
    return boo<T>
}
