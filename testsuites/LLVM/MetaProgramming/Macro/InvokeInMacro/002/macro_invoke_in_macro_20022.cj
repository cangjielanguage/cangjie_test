// DEPENDENCE: define_20022.cj main_20022.cj
// EXEC: %compiler %cmp_opt define_20022.cj -c -backend-options="-fPIC" %enable_macro
// ERRCHECK: %compiler %cmp_opt %f -c ./%llvm_attach/define_20022.o %use_pic_ast %enable_macro

package use

from ast import ast.*
import define_20022.*

interface op{
    operator func [](b:This,c:This):Unit
}

extend Tokens <: op{
    operator func [](b:Tokens,c:Tokens){}
}

external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[123](123)[@X[123](123)] = @X[123](123)   // EXPECTED: regex-auto illegal left value
    return @X[123](123)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace