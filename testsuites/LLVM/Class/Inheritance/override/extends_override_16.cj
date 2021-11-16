// EXEC: %compiler %cmp_opt -c %f -o %output

abstract class Base {
    func foo(): Int32
}

abstract class Data <: Base {
    func foo(): Int32
}
