
$dirstomerge = Get-ChildItem In -Directory

Remove-Item Out\*.*

foreach($dir in $dirstomerge)
{
   
   $filestomerge = Get-ChildItem In\$dir -File

   foreach($file in $filestomerge)
   {

     if ($file.Extension -eq ".txt")
     {
        if (-Not (Test-Path Out\$file))
        { 
            New-Item Out\$file -Force
        }

        write-host $file
    
        Add-Content Out\$file -value (Get-Content In\$dir\$File)
     }

   }

}