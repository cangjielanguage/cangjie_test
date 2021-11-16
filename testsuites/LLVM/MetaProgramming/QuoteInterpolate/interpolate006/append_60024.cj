package append_60024

from ast import ast.*

external interface A{}
external class B <: A{}

append A with ToTokens {
    func toTokens(self:A): Tokens {
        return quote(0)
    }
}
