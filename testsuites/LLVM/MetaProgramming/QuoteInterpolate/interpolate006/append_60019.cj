package append_60019

from ast import ast.*

external record A<T>{}

append A<Int64> with ToTokens {
    func toTokens(self:A<Int64>): Tokens {
        return quote(0)
    }
}
