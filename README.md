# NotAAzurePipilineCesitar
Script en broma para agilizar la ""pacada/unpacada"" de una app de powerApps.

#Pasos:
##Configurar variable de entorno
Buscar ruta de pasopa, colocarla dentro del .bat en la variable SAYCORON_PASOPATH y ejecutarlo como administrador.

##Importar modulo a powerShell 
Import-module (Ruta archivo NotAAzurePipilineCesitar.psm1)

##Verificar que hemos importado correctamente el módulo usando el comando Get-Module y verificando que se encuentra en la lista.
 
##Configurar modulo para que cargue automáticamente en powershell(Opcional)
Si queremos que al abrir PS ya tendremos importado el Código tendremos que hacer lo siguiente:
- Escribiremos $env:PSModulePath, Esto mostrara todas las carpetas donde puedo guardar mis módulos para que carguen directamente al arrancar PS.
- Abrimos alguna de las carpetas de la lista y copiaremos el módulo.
- Cerramos y abrimos el powershell.


##Uso
Usaremos el comando NotAAzurePipilineCesitar para abrir el asistente que funciona a tiro de click..
