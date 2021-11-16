package append_20094

from ast import ast.*


append Int64*Int64 with ToTokens {
    func toTokens(self:Int64*Int64): Tokens {
        return quote(0)
    }
}