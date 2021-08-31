@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your storage account
set subscription_id=e474a0dd-ffb5-4b09-9761-aff530319a56
set azure_storage_account=crystalbelstor
set azure_storage_key=rT1k55Tt1g0fVhL4rEfyKKHyQGvXCNE2jw1etmpKACZYsKFKevT7DqIPjrcH1Yb4K38oyAgqT6LDxajgJAEZNw==


echo Creating container...
call az storage container create --account-name !azure_storage_account! --subscription !subscription_id! --name margies --public-access blob --auth-mode key --account-key !azure_storage_key! --output none

echo Uploading files...
call az storage blob upload-batch -d margies -s data --account-name !azure_storage_account! --auth-mode key --account-key !azure_storage_key!  --output none
