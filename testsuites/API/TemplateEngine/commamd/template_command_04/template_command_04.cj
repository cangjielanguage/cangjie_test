//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/ab.tpl
//EXEC: %ls -l %n | compare %f
//ASSERT: scan AbTemplate.cj
//ASSERT: scan-not abTemplate.cj
