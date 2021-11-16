// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-cfg
// EXEC:%compiler %cmp_opt -i ast-cfg %f -o %output 2>&1 | compare %f

@java
class CJClass {
    var a: Unit = () // EXPECTED: regex 'Unit' cannot be used as a member variable type in java interoperation

    func test(): Unit {
        print("in CJClass\n")
    }
}
