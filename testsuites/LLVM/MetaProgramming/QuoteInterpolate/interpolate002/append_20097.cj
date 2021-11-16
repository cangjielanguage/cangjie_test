package append_20097

from ast import ast.*

external enum E{e(Int64)}

append E with ToTokens {
    func toTokens(self: E): Tokens {
        return quote(0)
    }
}