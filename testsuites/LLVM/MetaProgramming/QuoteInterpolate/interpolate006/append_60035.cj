package append_60035

from ast import ast.*



append<T> List<T> with ToTokens {
    func toTokens(self:List<T>): Tokens {
        return quote(0)
    }
}
