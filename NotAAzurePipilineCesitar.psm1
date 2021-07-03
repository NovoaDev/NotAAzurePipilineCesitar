Function NotAAzurePipilineCesitar {
    $Opciones = [System.Management.Automation.Host.ChoiceDescription[]] @("Abrir el paquetote", "Sacar el paquetote")
    $Seleccion = $host.UI.PromptForChoice("Flojoasistente" , "   ¿Que quieres hacer gentuza?" , $Opciones, 0)
    $Pasopapath = $Env:SAYCORON_PASOPATH

    switch ($Seleccion) {
        0 {
            $RutaArchivo0 = ObtenerArchivo
            $RutaCarpeta0 = ObtenerCarpeta("Seleccione carpeta donde quiere despaquetar")
            $Comando = $Pasopapath + "\pasopa -unpack " + $RutaArchivo0 + " " + $RutaCarpeta0 
        }
        1 {   
            $RutaCarpeta1 = ObtenerCarpeta("Seleccione la carpeta de proyecto despaquetado")
            $RutaCarpeta2 = ObtenerCarpeta("Seleccione donde quiere meter el paquetote")
            $Comando = $Pasopapath + "\pasopa -pack " + $RutaCarpeta2 + "\Paquetote.msapp " + $RutaCarpeta1 
        }
    }
    if ($Comando.FileName -ne "") { 
      Invoke-Expression -Command $Comando
    }
}

Function ObtenerArchivo {
    [void] [System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms')

    $SeleccionArchivo = New-Object System.Windows.Forms.OpenFileDialog
    $SeleccionArchivo.filter = "Paquetote|*.msapp"
    $SeleccionArchivo.ShowDialog() | Out-Null
    if ($SeleccionArchivo.FileName -eq "") { 
        ErrorMessage(0) 
    }
    else 
    { 
        return $SeleccionArchivo.FileName  
    }
}

Function ObtenerCarpeta($DescripcionDialog) {
    [void] [System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms')

    $SeleccionCarpeta = New-Object System.Windows.Forms.FolderBrowserDialog
    $SeleccionCarpeta.Description = $DescripcionDialog

    $Topmost = New-Object System.Windows.Forms.Form
    $Topmost.TopMost = $True
    $Topmost.MinimizeBox = $True

    $SeleccionCarpeta.ShowDialog($Topmost) | Out-Null
    return $SeleccionCarpeta.SelectedPath
}

Export-ModuleMember -Function NotAAzurePipilineCesitar