// ERRCHECK: %compiler %cmp_opt %f -o %output

class SomeType3 {
    open ~init() {} // EXPECTED: regex modifier is not allowed here
}