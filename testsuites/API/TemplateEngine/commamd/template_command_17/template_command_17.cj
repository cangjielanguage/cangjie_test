//DEPENDENCE:../%n
//EXEC: chmod 111  %n/Mb.tpl
//EXEC-PIPE-1: %tool_path/engine %n/Mb.tpl | compare %f
//ASSERT: scan  RuntimeException
