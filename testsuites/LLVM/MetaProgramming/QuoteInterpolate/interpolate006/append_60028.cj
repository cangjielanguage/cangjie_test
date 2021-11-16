package append_60028

from ast import ast.*

external enum A<T>{a(T)}

append A<Int64> with ToTokens {
    func toTokens(self:A<Int64>): Tokens {
        return quote(0)
    }
}
