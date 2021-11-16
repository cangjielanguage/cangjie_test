package B
import A.*

external interface Bar {}

extend Foo {
    func h() {}
}

func g() {
    let a = Foo()
    a.h()
}