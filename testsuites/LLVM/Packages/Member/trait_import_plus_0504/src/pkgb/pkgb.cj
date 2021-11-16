package pkgb
import pkga.*


external trait Color<T> {
    func addcolor(a: This,b:T):T
}

append<V1,V2> Fruit<V1> with Color<V2> {
    func addcolor(a: Fruit<V1>,b:V2): V2 {
        return b
    }
}