package append_60015

from ast import ast.*



append<T> T*T with ToTokens {
    func toTokens(self:T*T): Tokens {
        return quote(0)
    }
}
