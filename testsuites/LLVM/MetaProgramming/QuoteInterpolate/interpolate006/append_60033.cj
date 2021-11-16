package append_60033

from ast import ast.*



append<T> Array<T> with ToTokens {
    func toTokens(self:Array<T>): Tokens {
        return quote(0)
    }
}
