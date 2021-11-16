// ERRCHECK: %compiler %cmp_opt %f -o %output

open class SomeType4 {
    ~init() {} // EXPECTED: regex finalizer is forbidden in class 'SomeType4' that is open
}