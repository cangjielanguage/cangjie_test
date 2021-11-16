//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/.tpl | compare %f
//ASSERT: scan  IllegalArgumentException The file name must start with a letter!
