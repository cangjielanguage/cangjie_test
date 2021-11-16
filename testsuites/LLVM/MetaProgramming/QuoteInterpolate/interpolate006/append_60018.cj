package append_60018

from ast import ast.*

external record A{}

append A with ToTokens {
    func toTokens(self:A): Tokens {
        return quote(0)
    }
}
