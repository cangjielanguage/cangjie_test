package append_40005

from ast import ast.*

external class A{}

external var a = A()

append A with ToTokens {
    func toTokens(self: A): Tokens {
        return quote(0)
    }
}