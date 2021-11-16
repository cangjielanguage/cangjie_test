// DEPENDENCE: p1/InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import p1.*
import java.lang.*
import ffi.java.*

func main(): Int64 {
    var a: A<JString> = A<JString>()
    if (a.test() == 11 && A<JString>.staticFunc() == 10) {
        a.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}

@java
external class A<T> <: InteropTest.InnerClass<T> { // EXPECTED: regex error.*undeclared type name 'InnerClass'
    var a:T;
    init(x:T){
        super(x)
        a = x
    }
    override func show<T>(t: T): Unit {
        print("override\n")
    }
}