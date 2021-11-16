//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.tpl
//EXEC: %ls -l %n | compare %f
//ASSERT: scan MbTemplate.cj
//ASSERT: scan-not mbTemplate.cj
