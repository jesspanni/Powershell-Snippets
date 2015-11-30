# NOTE in order to run AAD powershell you must first install the following:
# 1. Microsoft Online Services Sign-In Assistant for IT Professionals RTW found at http://www.microsoft.com/en-us/download/details.aspx?id=41950
# 2. The 64 bit AAD Powershell module https://bposast.vo.msecnd.net/MSOPMW/Current/amd64/AdministrationConfig-en.msi

# IMPORTANT - The user you use to administrate Azure AD must be a user in Azure AD (e.g. admin@myazuretennant.onmicrosoft.com),
# You cannot use a microsoft account to login.

$cred = get-credential
connect-msolservice -credential $cred

# List all users
get-msoluser



