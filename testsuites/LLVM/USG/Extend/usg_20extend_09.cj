// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo<T> {
    var item: T
    init(it: T) {
        item = it
    }
}

interface Eq<T> {
    func equals(other: T): Bool
}

extend Foo<T> <: Eq<Foo<T>> where T <: Eq<T> {
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

func g<T>(e: Eq<T>) {}

func main() {
//    g(Foo<A>(A())) // error, A has not implemented Eq
    g(Foo<B>(B())) // ok, B has implemented Eq
    return 0
}