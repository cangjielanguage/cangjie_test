package append_60043

from ast import ast.*
from std import collection.*


extend HashSet<T>  <: ToTokens {
    func toTokens(): Tokens {
        return quote(0)
    }
}
