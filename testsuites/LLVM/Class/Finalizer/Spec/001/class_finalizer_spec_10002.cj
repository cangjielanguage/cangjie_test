// ERRCHECK: %compiler %cmp_opt %f -o %output

class SomeType2 {
    private ~init() {} // EXPECTED: regex modifier is not allowed here
}