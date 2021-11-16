package append_60031

from ast import ast.*



append<T> Option<T> with ToTokens {
    func toTokens(self:Option<T>): Tokens {
        return quote(0)
    }
}
