// ERRCHECK: %compiler %cmp_opt %f -o %output

class SomeType1 {
    ~init(x: Int64) {} // EXPECTED: regex finalizer cannot have parameter
}