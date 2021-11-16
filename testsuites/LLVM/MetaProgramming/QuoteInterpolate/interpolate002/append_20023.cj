package append_20023

from ast import ast.*


append<T> T with ToTokens {
    func toTokens(self:T): Tokens {
        return quote(0)
    }
}