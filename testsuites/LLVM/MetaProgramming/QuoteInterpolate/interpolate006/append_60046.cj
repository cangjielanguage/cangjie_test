package append_60046

from ast import ast.*



append<T> Map<T,T> with ToTokens {
    func toTokens(self:Map<T,T>): Tokens {
        return quote(0)
    }
}
