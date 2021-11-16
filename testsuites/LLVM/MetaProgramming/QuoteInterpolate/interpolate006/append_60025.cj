package append_60025

from ast import ast.*

external interface A<T>{}
external class B<T> <: A<T>{}

extend B<T> <: ToTokens {
    func toTokens(): Tokens {
        return quote(0)
    }
}
