package append_60030

from ast import ast.*



append Option<Int64> with ToTokens {
    func toTokens(self:Option<Int64>): Tokens {
        return quote(0)
    }
}
