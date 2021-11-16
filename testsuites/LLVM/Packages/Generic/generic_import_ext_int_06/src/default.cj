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
    var a: A<JString> = A<JString>(J"abc")
    return 0
}

@java
external class A<T>  {
    var a : T
    init(x:T){ a = x }
    func foo(){
        return InteropTest.InnerClass<T>(a).num // EXPECTED: regex error.*'InnerClass' is not a member of class 'InteropTest'
    }
}