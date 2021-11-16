//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.tpl
//EXEC: %ls -l %n/MbTemplate.cj | compare %f
//ASSERT: scan -rwx------
