// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-cfg
// EXEC:%compiler %cmp_opt -i ast-cfg %f -o %output 2>&1 | compare %f

@java
class CJClass {
    func test(a: Unit): Unit { // EXPECTED: regex 'Unit' cannot be used as a function parameter type in java interoperation
        print("in CJClass\n")
    }
}
