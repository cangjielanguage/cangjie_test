package append_20001

from ast import ast.*


append ()->Unit with ToTokens {
    func toTokens(self:()->Unit): Tokens {
        return quote(0)
    }
}