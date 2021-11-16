package append_60027

from ast import ast.*

external enum A{a(Int64)}

append A with ToTokens {
    func toTokens(self:A): Tokens {
        return quote(0)
    }
}
