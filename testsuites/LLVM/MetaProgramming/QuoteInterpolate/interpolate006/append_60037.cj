package append_60037

from ast import ast.*



append<T> ArrayList<T> with ToTokens {
    func toTokens(self:ArrayList<T>): Tokens {
        return quote(0)
    }
}
