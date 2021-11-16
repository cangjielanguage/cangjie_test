package pkgb

class Boo1 <: Minus<Boo1>{
    func minus(other: Boo1): Boo1 {
        return this
    }
}
interface Minus<T> {
    func minus(other: T): T
}
