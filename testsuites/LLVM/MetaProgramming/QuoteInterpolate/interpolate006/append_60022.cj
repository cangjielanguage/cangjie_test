package append_60022

from ast import ast.*

external class A<T>{}

append A<Int64> with ToTokens {
    func toTokens(self:A<Int64>): Tokens {
        return quote(0)
    }
}
