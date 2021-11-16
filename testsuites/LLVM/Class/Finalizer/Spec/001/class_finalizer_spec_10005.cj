// ERRCHECK: %compiler %cmp_opt %f -o %output

var GlobalVar: SomeType5 = SomeType5()
class SomeType5 {
    ~init() {
        GlobalVar = this // EXPECTED: regex 'this' cannot be used as an expression in the finalizer
    }
}