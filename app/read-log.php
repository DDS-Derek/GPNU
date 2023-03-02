<?php
$file = "GPNU.txt";
$handle = fopen($file, "r");
if ($handle) {
  while (($line = fgets($handle)) !== false) {
    echo "<p>" . $line . "</p>";
  }
  fclose($handle);
} else {
  echo "<p>无法打开文件！</p>";
}
?>