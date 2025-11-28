# Script para actualizar todos los servicios con environment
$servicesPath = "c:\Users\USER\Downloads\fron\gym-frontend - V1\src\app\services"
$services = @(
    "trabajador.service.ts",
    "suscripciones.service.ts",
    "reservas.service.ts",
    "recordatorios.service.ts",
    "promociones.service.ts",
    "planes.service.ts",
    "perfil.service.ts",
    "membresias.service.ts",
    "dashboard.service.ts",
    "consultas.service.ts",
    "carrito.service.ts",
    "calificaciones.service.ts",
    "admin-usuarios.service.ts",
    "admin-reservas.service.ts",
    "admin-promociones.service.ts",
    "admin-productos.service.ts",
    "admin-pedidos.service.ts",
    "admin-estadisticas.service.ts",
    "admin-suscripciones.service.ts",
    "pagos.service.ts"
)

foreach ($service in $services) {
    $filePath = Join-Path $servicesPath $service
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        
        # Agregar import si no existe
        if ($content -notmatch "import.*environment") {
            $content = $content -replace "(import { HttpClient } from '@angular/common/http';)", "`$1`nimport { environment } from '../../environments/environment';"
        }
        
        # Reemplazar URLs hardcodeadas
        $content = $content -replace "private base = '/api/", "private base = `"`${environment.apiUrl}/"
        
        Set-Content -Path $filePath -Value $content -NoNewline
        Write-Host "✓ Actualizado: $service" -ForegroundColor Green
    }
}

Write-Host "`n✓ Todos los servicios han sido actualizados!" -ForegroundColor Cyan
