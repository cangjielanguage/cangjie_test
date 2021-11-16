// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

interface I1<T> {}
interface I2<T> {}

class C1<T> <: I1<T> & I1<T> {} // EXPECTED: regex-auto class 'C1' inherits or implements duplicate interface 'I1'
class C2<T> <: I1<T> {}
extend C2<T> <: I1<T> {}    // EXPECTED: regex-auto type 'Class-C2<Generics-T>' inherits or implements duplicate interface 'Interface-I1<Generics-T>'

interface II1<T> <: I1<T> & I1<T> {}    // EXPECTED: regex-auto interface 'II1' inherits or implements duplicate interface 'I1'
interface II2<T> <: I1<T> {}
extend II2<T> <: I1<T> {}       // EXPECTED: regex-auto extending type 'Interface-II2<Generics-T>' is not allowed

record R1<T> <: I1<T> & I1<T> {}    // EXPECTED: regex-auto record 'R1' inherits or implements duplicate interface 'I1'
record R2<T> <: I1<T> {}
extend R2<T> <: I1<T> {}    // EXPECTED: regex-auto type 'Record-R2<Generics-T>' inherits or implements duplicate interface 'Interface-I1<Generics-T>'

enum E1<T> <: I1<T> & I1<T> { A | B }  // EXPECTED: regex-auto enum 'E1' inherits or implements duplicate interface 'I1'
enum E2<T> <: I1<T> { C | D }
extend E2<T> <: I1<T> {}    // EXPECTED: regex-auto type 'Enum-E2<Generics-T>' inherits or implements duplicate interface 'Interface-I1<Generics-T>'
