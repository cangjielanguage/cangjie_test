// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerInterface {
    func test(): Int32 {
        return InteropTest.InnerInterface.num2
    }
}

class Test<T> where T <: InteropTest.InnerInterface {
    var t: T
    init(t: T) {
        this.t = t
    }
}

func main(): Int64 {
    var test: Test<InteropTest.InnerInterface> = Test<InteropTest.InnerInterface>(A()) // EXPECTED: regex can not instantiate 'Generics-T' by interface or abstract class 'Interface-InnerInterface' for it has unimplemented static function
    if (test.t.test() == 1 && test.t.defaultFunc() == 2 && InteropTest.InnerInterface.staticFunc() == 3) {
        test.t.show<InteropTest.InnerInterface>(JArray<InteropTest.InnerInterface>([A(), A()]))
        return 0
    }
    return 1
}
