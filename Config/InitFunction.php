<?php
/*
 * 初始化函数库
 * */

  function getLogFilePath($dir,$size,$prefix)
  {
      //日志文件 分割
      $i = 1;
      while (true) {
          $file_path = $dir . DIRECTORY_SEPARATOR . $prefix.'_' . date('Y-m-d') . '_' . $i . '.log';
          if (!file_exists($file_path) || filesize($file_path) < $size) break;
          if (file_exists($file_path) && filesize($file_path) >= $size) {
              if (!file_exists($file_path)) break;
          }
          $i++;
      }

      if(isset($file_path)) return $file_path;
      return false;
  }