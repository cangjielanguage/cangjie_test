import java.lang.*

@java
class Test {
    func test1(num: Int32): Unit {
        var a: Int32 = 1 / num
    }

    func test2(num: Int32): Unit {
        test1(num)
    }

    func test3(num: Int32): Unit {
        test2(num)
    }

    func test4(num: Int32): Unit {
        test3(num)
    }

    func test5(num: Int32): Unit {
        test4(num)
    }
}
