package append_60044

from ast import ast.*



append<T> Set<T> with ToTokens {
    func toTokens(self:Set<T>): Tokens {
        return quote(0)
    }
}
