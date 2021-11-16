// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I {}
class Foo <: I {}
extend Foo <: I {} // EXPECTED: regex type 'Class-Foo' inherits or implements duplicate interface 'Interface-I'

func main() {

    return 0
}