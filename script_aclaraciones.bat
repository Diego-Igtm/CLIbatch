rem (Creacion de los usuarios)
net user e1 1234 /add
net user o1 1234 /add
net user v1 1234
net localgroup vendedores v1 /add
net localgroup operarios o1 /add
net localgroup encargados e1 /add

D:
cd D:\

rem (Creacion de las distintas carpetas)
md Almacen\Proveedores
md Ventas
cd Almacen
md Inventario Mantenimiento
cd Proveedores
md Pedidos Catalogos
cd ..\..\Ventas
md Pedidos Facturas Marketing
cd ..\

rem (Gestion de los permisos)
icacls Almacen /grant "operarios:(OI)(CI)(M)" /grant "encargados:(OI)(CI)(M)" /remove Usuarios /T
icacls Ventas /grant "vendedores:(OI)(CI)(M)" /grant "encargados:(OI)(CI)(M)" /remove Usuarios /T

rem (Testeo de lo creado)
runas /user:o1 "cmd /c echo hola > D:\Almacen\prueba.txt"
runas /user:o1 "cmd /c type D:\Almacen\prueba.txt"

dir /Q D:\almacen

runas /user:o1 "cmd /c md D:\Almacen\micarpeta"
runas /user:o1 "cmd /c dir D:\Almacen"