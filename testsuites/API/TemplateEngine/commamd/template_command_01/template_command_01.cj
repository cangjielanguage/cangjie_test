//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.tpl
//EXEC: cat %n/MbTemplate.cj | compare %f
//ASSERT: scan import io.*
