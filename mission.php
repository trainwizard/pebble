<!DOCTYPE html>
<html>
<head>
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
    <title>Lisp Interface Test</title>
</head>
<body>
<h2>Lisp Interface Test</h2>
<?php
    print "testing clisp interface ...<br>\n";
    $results = '';
    $fp = popen("/usr/local/bin/clisp ./missionh.lsp", "r");
    $results .= fread($fp, 1024);
    pclose($fp);

    print "\$results = '" . $results . ".'";
    flush();
?>
</body>
</html>
