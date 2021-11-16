package append_60020

from ast import ast.*

external record A<T>{}

append<T> A<T> with ToTokens {
    func toTokens(self:A<T>): Tokens {
        return quote(0)
    }
}
