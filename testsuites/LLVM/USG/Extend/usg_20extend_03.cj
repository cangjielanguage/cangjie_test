// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Foo<T> {}
extend Foo<T> {}
extend Foo {}        // EXPECTED: regex generic type should be used with type argument
extend Foo<R> {}     // EXPECTED: regex generics do not match the declaration of 'Class-Foo<Generics-T>'
extend Foo<T, R> {}  // EXPECTED: regex type argument's number does not match type parameter's number
extend Foo<Int32> {} // EXPECTED: regex generics do not match the declaration of 'Class-Foo<Generics-T>'

func main() {

    return 0
}