<?php
/*
 * File: php_quick_sort.php
 * Author: Isaac Hernandez
 * Date: October 30, 2017
 * Summary: Quicksort in PHP
 */

function swap(&$arry, $i, $j) {
  $t = $arry[$i];
  $arry[$i] = $arry[$j];
  $arry[$j] = $t;
}

function quicksort(&$arry) {
  quicksort_helper($arry, 0, count($arry)-1);
}

function quicksort_helper(&$arry, $low, $high) {
  if ($low < $high) {
    $index = hoares_partition($arry, $low, $high);
    quicksort_helper($arry, $low, $index-1);
    quicksort_helper($arry, $index, $high);
  }
}

function hoares_partition(&$arry, $low, $high) {
  $pivot = $arry[($low+$high)/2];
  while($low <= $high) {
    while ($arry[$low] < $pivot) { $low++; }
    while ($arry[$high] > $pivot) { $high--; }

    if ($low <= $high) {
      swap($arry, $low, $high);
      $low++;
      $high--;
    }
  }
  return $low;
}

function measure_sorting_algo($arry) {
  echo "===============\n";
  echo "UNSORTED: [" . join(", ", $arry) . "]\n";
  $start = microtime(true);
  quicksort($arry);
  $time = (microtime(true) - $start) * 1000;
  echo "SORTED  : [" . join(", ", $arry) . "]\n";
  echo "TIME    : " . $time . " ms\n";
  echo "==============\n";
}

$file = fopen($argv[1], "r");
$n = (int)fgets($file);
for ($i=0; $i<$n; $i++) {
  $line1 = explode(" ", fgets($file));
  $arry = array();
  if (((int)$line1[1]) > 0) {
    $line2 = explode(" ", fgets($file));
    for($j=0; $j<((int)$line1[1]); $j++) {
      array_push($arry, ($line1[0] == "string" ? str_replace("\n", "", $line2[$j]) : (int)$line2[$j]));
    }
  }
  measure_sorting_algo($arry);
}
fclose($file);
?>

