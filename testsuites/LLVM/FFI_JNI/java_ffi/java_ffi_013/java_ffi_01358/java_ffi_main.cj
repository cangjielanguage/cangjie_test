import java.lang.*

@java
class Test {
    func test(): Unit {
        var a = @{1, 2}
        var i: Int64 = 1
        while(i > -2) {
            var b: Int64 = a[i]
            i--
        }
    }
}
