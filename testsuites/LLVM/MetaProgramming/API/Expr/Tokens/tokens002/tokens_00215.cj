// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output %run_args

from ast import ast.*

func main() {
    var tkList = @{Token(TokenKind.DOT),Token(TokenKind.COMMA),Token(TokenKind.LPAREN),Token(TokenKind.RPAREN),Token(TokenKind.LSQUARE),Token(TokenKind.RSQUARE),Token(TokenKind.LCURL),Token(TokenKind.RCURL),Token(TokenKind.EXP),Token(TokenKind.MUL),Token(TokenKind.MOD),Token(TokenKind.DIV),Token(TokenKind.ADD),Token(TokenKind.SUB),
Token(TokenKind.UNSAFEEXP),Token(TokenKind.UNSAFEMUL),Token(TokenKind.UNSAFEADD),Token(TokenKind.UNSAFESUB),Token(TokenKind.INCR),Token(TokenKind.DECR),
Token(TokenKind.AND),Token(TokenKind.OR),Token(TokenKind.COALESCING),Token(TokenKind.PIPELINE),Token(TokenKind.COMPOSITION),Token(TokenKind.NOT),
Token(TokenKind.BITAND),Token(TokenKind.BITOR),Token(TokenKind.BITXOR),Token(TokenKind.BITNOT),Token(TokenKind.LSHIFT),Token(TokenKind.RSHIFT),Token(TokenKind.COLON),
Token(TokenKind.SEMI),Token(TokenKind.ASSIGN),Token(TokenKind.ARROW),Token(TokenKind.RANGEOP),Token(TokenKind.CLOSEDRANGEOP),Token(TokenKind.ELLIPSIS),
Token(TokenKind.HASH),Token(TokenKind.AT),Token(TokenKind.QUEST),Token(TokenKind.LT),Token(TokenKind.GT),Token(TokenKind.LE),Token(TokenKind.GE),Token(TokenKind.IS),
Token(TokenKind.AS),Token(TokenKind.NOTEQ),Token(TokenKind.EQUAL),Token(TokenKind.WILDCARD),Token(TokenKind.INT8),Token(TokenKind.INT16),Token(TokenKind.INT32),
Token(TokenKind.INT64),Token(TokenKind.INTNATIVE),Token(TokenKind.UINT8),Token(TokenKind.UINT16),Token(TokenKind.UINT32),Token(TokenKind.UINT64),Token(
TokenKind.UINTNATIVE),Token(TokenKind.FLOAT16),Token(TokenKind.FLOAT32),Token(TokenKind.FLOAT64),Token(TokenKind.CHAR),Token(TokenKind.BOOLEAN),Token(TokenKind.UNIT),Token(TokenKind.RECORD),
Token(TokenKind.ENUM),Token(TokenKind.ARRAY),Token(TokenKind.CFUNC),Token(TokenKind.THISTYPE),Token(TokenKind.PACKAGE),Token(TokenKind.IMPORT),Token(TokenKind.CLASS),Token(TokenKind.INTERFACE),Token(TokenKind.FUNC),Token(TokenKind.MACRO),Token(TokenKind.QUOTE),
Token(TokenKind.DOLLAR),Token(TokenKind.OBJECT),Token(TokenKind.LET),Token(TokenKind.VAR),Token(TokenKind.INIT),Token(TokenKind.THIS),
Token(TokenKind.SUPER),Token(TokenKind.IF),Token(TokenKind.ELSE),Token(TokenKind.CASE),Token(TokenKind.TRY),Token(TokenKind.CATCH),
Token(TokenKind.FINALLY),Token(TokenKind.FOR),Token(TokenKind.DO),
Token(TokenKind.WHILE),Token(TokenKind.ADJOINT),Token(TokenKind.GRAD),Token(TokenKind.VALWITHGRAD),Token(TokenKind.MOVE),Token(TokenKind.THROW),
Token(TokenKind.THROWS),Token(TokenKind.RETURN),Token(TokenKind.CONTINUE),Token(TokenKind.BREAK),Token(TokenKind.IN),Token(TokenKind.MATCH),Token(TokenKind.FROM),
Token(TokenKind.WHERE),Token(TokenKind.EXTEND),Token(TokenKind.WITH),Token(TokenKind.PROP),Token(TokenKind.STATIC),
Token(TokenKind.PUBLIC),Token(TokenKind.PRIVATE),Token(TokenKind.PROTECTED),Token(TokenKind.INTERNAL),Token(TokenKind.EXTERNAL),Token(TokenKind.OVERRIDE),
Token(TokenKind.REDEF),Token(TokenKind.ABSTRACT),Token(TokenKind.OPEN),Token(TokenKind.FOREIGN),Token(TokenKind.MUT),Token(TokenKind.UNSAFE),
Token(TokenKind.OPERATOR),Token(TokenKind.SPAWN),Token(TokenKind.SYNCHRONIZED),Token(TokenKind.UPPERBOUND),Token(TokenKind.NONE),Token(TokenKind.IDENTIFIER),
Token(TokenKind.COMMENT),Token(TokenKind.NL),Token(TokenKind.END),Token(TokenKind.SENTINEL),Token(TokenKind.ANNOTATION),Token(TokenKind.ILLEGAL)}
    var tks = Tokens(tkList)
    if (tks.toString() != ". , ( ) [ ] { } ** * % / + - **& *& +& -& ++ -- && || ?? |> ~> ! & | ^ ~ << >> : ; = -> .. ..= ... # @ ? < > <= >= is as != == _ Int8 Int16 Int32 Int64 IntNative UInt8 UInt16 UInt32 UInt64 UIntNative Float16 Float32 Float64 Char Bool Unit record enum Array CFunc This package import class interface func macro quote $ object let var init this super if else case try catch finally for do while adjointOf grad valWithGrad mov throw throws return continue break in match from where extend with prop static public private protected internal external override redef abstract open foreign mut unsafe operator spawn synchronized <:         ") {
        return 1
    }
    return 0
}
