{ lib, ... }: {
  activeUsers = lib.mkDefault [ "maxou" ];
  users = {
    maxou = {
      uid = 1000;
      name = "Maxou Verzou";
      email = "maxou@integratedintegrals.com";
      sshKeys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiqi1UA8GNZADOKtH5R+xArRVPqeIgFpIMZzbQwKkbkJ8Y+k5/c6miN3NPluKxl9KYFQKUWSTiv7+r6Z5NWs6fkCG+XvLpYR/h6v9qCCgg2yvKHArbywwN23KacuVXWWzLtT5KbYmOAufHiKn48FmZwoVbU15/dgGaZg/xfd0IeUpMjJ9jhZtl9XM/KVnG5RQIg/RdwEc0CIzjjtkJYp6FPX6fFaSbOlGTk2b4CcfPtnUuvBdSEjl2G+sPxnrQOI6EoCoQKex8UvYCJLRKXPgGA8jUnFaKJX1Oy71eQxEiSMtdBoAIlw81TAWJGdwo5TMpcRTIjqsYxVyweFHKw21yyWIXWNJPyxOX1YFDgRS6sOm2tretH5lSCpemNXfzqYwel9K8jLGxmu6FU6sIFxoBy+AIOjoCYbRfAzDW4C5gIuUSBoLv9V3p0PQxOEwRYSiFdJceEu2tRcwAMAoWBJxrZBnBHJmvH+EupiR+GjhJbcWozMzL6a/wthL19P+AIFU= maxou@kiosk"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2Y8dtZJg2mLATEOc79lD2KDCOo22AqoxLS/ZLqTmFnLTGda6YrZ6avhm8uw+mR7ciYX/FwG0NXLwctVdSZLNjsEWkfjD1p/HC0BQMGuORBhkg4gBUi/5lt4krVWfwiqZJvvPr76TyCAZa0zQZwgwKSduq5bCamLi0q+mQ+T8+TIxIg8ZB425L2EdfHDMKJpTj0CxSlARbSJ3OjVJmfP3tzDxFAo83UFGvvQfIH1nb/G2not4BgePNcz356ZbqcaRlWDjIHZVu2kIRKhBNViu6R7kRHLouOb/k6iQQ3cBapCOB/jIFbFBxaj/cjWKy3E6iNPYpzen1B/k5Mdq9dprWm/gehJPRmLw8MXTOvvms7u7QOqTctJ1sd8Wszcalgk03nWIAuTPd2ntl8XPCUOCJylX2CK+eJ+PBnrIkRFo7Oy2f7UwpoByY6+o7g3Bu0WUqbPNOz1mwq5/GeZtoDYC1rbSxYFWqD0pQDPgi07M+/xHa3pP3xYrC07r7BHOKfA8= maxou@wheathley"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJO/w+ri80XNmJCWceuPSXSeBSbZbVyZC32hTl/hS5nN maxou@glados"
      ];
    };
    milou = {
      uid = 1001;
      name = "Milou";
      email = "mi@lou.com";
      sshKeys = [ ];
    };
  };
}
