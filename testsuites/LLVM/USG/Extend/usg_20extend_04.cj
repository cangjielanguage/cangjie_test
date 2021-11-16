// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    var item: T
    init(it: T) {
        item = it
    }
}

interface Eq<K> {
    func equals(other: K): Bool
}

extend Foo<T> where T <: Eq<T> {
    func equals(other: Foo<T>): Bool {
        if (this.item.equals(other.item)) {
            return true
        }
        return false
    }
}

class A {}
class B <: Eq<B> {
    func equals(other: B): Bool { true }
}

func main() {
    let a = Foo<A>(A())
//    a.equals(a) // error, A has not implemented Eq
    let b = Foo<B>(B())
    b.equals(b) // ok, B has implemented Eq
    return 0
}