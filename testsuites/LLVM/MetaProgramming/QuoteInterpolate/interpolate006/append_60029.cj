package append_60029

from ast import ast.*

external enum A<T>{a(T)}

append<T> A<T> with ToTokens {
    func toTokens(self:A<T>): Tokens {
        return quote(0)
    }
}
