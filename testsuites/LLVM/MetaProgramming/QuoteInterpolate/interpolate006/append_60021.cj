package append_60021

from ast import ast.*

external class A{}

append A with ToTokens {
    func toTokens(self:A): Tokens {
        return quote(0)
    }
}
