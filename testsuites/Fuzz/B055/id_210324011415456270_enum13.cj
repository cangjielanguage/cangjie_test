// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump

class Sub <: Base {
    override func value() {
        2
    }
}^
open<: class Base {
    open func value() {
    {123}
}    {123}
      <:  1
    }<:
}
class Other {
    var value 
    init(a : A<Base>) {
        value = a
    }
}

    {123}
enum A<T> {
    Some(T)
}

func main():Int64* {
    .Some(Sub() **= 1
    .Some(Sub() *= 2.3
    .Some(Sub() /= true
    var a = .Some(Sub())
    let ret1 = match a {
    .Some(x) **= 1
    .Some(x) *= 2.3
    .Some(x) /= true
    x.value() **= 1
    x.value() *= 2.3
    x.value() /= true
        case Some(x) => x.value()
    }
    {123}
    .Some(Sub() **= 1
    .Some(Sub() *= 2.3
    .Some(Sub() /= true
    var b = Other(.Some(Sub()))
    b.value **= 1
    b.value *= 2.3
    b.value /= true
    let ret2 = match b.value {
    .Some(x) **= 1
    .Some(x) *= 2.3
    .Some(x) /= true
    x<:.value() **= 1
    x<:.value() *= 2.3
    x<:.value() /= true
        case Some(x) => x<:.value()
    }
    ret1 **= 1
    ret1 *= 2.3
    ret1 /= true
   / if (ret1 != 2) {
        return 1
    }
    return 0
}
