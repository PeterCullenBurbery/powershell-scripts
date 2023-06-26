$GitHubDirectory = "C:\\Users\\Peter\\OneDrive - Marshall University\GitHub"

# Set the environment variable
[Environment]::SetEnvironmentVariable("GitHubDirectory", $GitHubDirectory, "User")

# Verify the environment variable is set
Write-Output "GitHubDirectory environment variable set to: $env:GitHubDirectory"
