{ pkgs, ... }:
{
  home.packages = with pkgs; [
    azure-cli
    # databricks-sql-cli # @FIXME broken
    powershell
    python3Packages.databricks-cli
    terraform
  ];
}
