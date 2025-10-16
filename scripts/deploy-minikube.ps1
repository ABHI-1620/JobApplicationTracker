<#
Deploy helper for Minikube (PowerShell)
Usage: Open PowerShell, cd to project root and run:
  .\scripts\deploy-minikube.ps1 -ImageTag job-tracker:lab -Port 8080
#>
param(
  [string]$ImageTag = 'job-tracker:lab',
  [int]$Port = 8080,
  [int]$TimeoutSeconds = 120
)

function Run-ExitOnError($cmd) {
  Write-Output "\n==> $cmd"
  $r = Invoke-Expression $cmd
  if ($LASTEXITCODE -ne 0) {
    throw "Command failed: $cmd (exit $LASTEXITCODE)"
  }
  return $r
}

# Build image
Write-Output "Building Docker image $ImageTag..."
Run-ExitOnError "docker build -t $ImageTag ."

# Load into minikube
Write-Output "Loading image into Minikube..."
Run-ExitOnError "minikube image load $ImageTag"

# Apply manifests
Write-Output "Applying Kubernetes manifests..."
Run-ExitOnError "kubectl apply -f k8s/deployment.yaml -f k8s/service.yaml"

# Wait for pod to be ready
Write-Output "Waiting for pod with label app=job-tracker to become ready (timeout ${TimeoutSeconds}s)..."
$start = Get-Date
while ($true) {
  $elapsed = (Get-Date) - $start
  if ($elapsed.TotalSeconds -ge $TimeoutSeconds) { break }
  $pod = kubectl get pods -l app=job-tracker -o jsonpath='{.items[0].metadata.name}' 2>$null
  if ($pod) {
    $ready = kubectl get pod $pod -o jsonpath='{.status.containerStatuses[0].ready}' 2>$null
    if ($ready -eq 'true') {
      Write-Output "Pod $pod is ready."
      break
    }
  }
  Start-Sleep -Seconds 2
}

if (-not $pod) { throw "No pod found with label app=job-tracker" }

# Start port-forward in the foreground (bind to 127.0.0.1)
Write-Output "Starting port-forward from localhost:$Port -> service/job-tracker-service:80"
Write-Output "Press Ctrl+C to stop port-forward."
# Build explicit argument array to avoid PowerShell parsing of the port mapping
$pfArgs = @('port-forward', 'svc/job-tracker-service', '--address', '127.0.0.1', "${Port}:80")
Write-Output "Running: kubectl $($pfArgs -join ' ')"
& kubectl @pfArgs
