package append_60023

from ast import ast.*

external class A<T>{}

append<T> A<T> with ToTokens {
    func toTokens(self:A<T>): Tokens {
        return quote(0)
    }
}
