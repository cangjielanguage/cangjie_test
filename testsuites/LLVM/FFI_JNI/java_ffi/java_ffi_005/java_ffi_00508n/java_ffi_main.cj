// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-cfg
// EXEC:%compiler %cmp_opt -i ast-cfg %f -o %output 2>&1 | compare %f

interface CJInterface {
    func test(a: Unit): Unit {
        print("in CJInterface\n")
    }
}

@java
class CJClass <: CJInterface {} // EXPECTED: regex xxx
