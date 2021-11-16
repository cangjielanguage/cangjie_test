package append_60038

from ast import ast.*


external class A{}
external type mytype = A

extend A <: ToTokens {
    func toTokens(): Tokens {
        return quote(0)
    }
}
