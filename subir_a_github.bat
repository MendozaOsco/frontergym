@echo off
echo ==========================================
echo    SUBIENDO PROYECTO A GITHUB AUTOMATICAMENTE
echo ==========================================
echo.

echo 1. Verificando estado de git...
git status
echo.

echo 2. Agregando archivos...
git add .
echo.

echo 3. Guardando cambios (Commit)...
git commit -m "Subir proyecto completo con render.yaml"
echo.

echo 4. Subiendo a GitHub...
echo    (Si te pide credenciales, ingresalas por favor)
git push -u origin main

echo.
echo ==========================================
echo    PROCESO FINALIZADO
echo ==========================================
echo.
echo Si viste algun error arriba (letras rojas), copialo y mandaselo a tu asistente.
echo Si dice "Everything up-to-date" o similar, VE A RENDER Y DALE RETRY.
echo.
pause
