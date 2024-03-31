import requests
import json
import module.data_synchronization as data_sync
from logging import config as logging_config
import os
import sys

def env_var_is_filled(variable):
    if os.environ.get(variable) is None:
        print("Error: "+variable+" environment variable is None")
        return False
    return True

def required_variables_exists():
    ret = True
    
    print("-------------------------------------")
    print("----- ELT Tool: Unit test Execution  ")
    print("-- 1. Checking if required variables are defined")
    print("-------------------------------------")
    
    if !env_var_is_filled("test_mode") or 
       !env_var_is_filled("POSTGRES_HOST") or 
       !env_var_is_filled("POSTGRES_USER") or 
       !env_var_is_filled("POSTGRES_PASSWORD") or 
       !env_var_is_filled("POSTGRES_DATABASE"):
       ret = False        
        
    if ret:
        print("Required variable test passed!")
    else:
        raise Exception("Not all required variables to execute a instance of Data Sync Engine exists.")
    
def testPostgresConnection():
    print("-- 2. Checking if Postgres connection is available and reachable")
    
        
# -- Vault is deprecated
def testVault():  
    ret = True
        
    vault_url = os.environ['vurl']  # Vault url
    if vault_url.startswith('https://'):
        print("Vault URL looks good")
    else:
        ret = False
        print("Vault URL value is not expected")
    
    vault_token = os.environ['vtoken']  # Copying my token from vault
    if vault_token.startswith('hvs.'):
        print("Vault token variable looks good (it not means token is correct)")
    else:
        ret = False
        print("Vault token value is not in the pattern requested")
    
    if ret:
        # vault_url = 'https://knox.io.nrs.gov.bc.ca/v1/groups/data/spar/test'
        headers = {'X-Vault-Token': vault_token}
        res = requests.get(vault_url, headers=headers)
        # print(res.text)    
        j = json.loads(res.text)
        # print(j)
        
    else:
        print("Vault cannot be reached as required variables are not correctly informed")


def main() -> None:
    logging_config.fileConfig(os.path.join(os.path.dirname(__file__), "logging.ini"), 
                              disable_existing_loggers=False)   
    data_sync.data_sync()

if __name__ == '__main__':
    definitiion_of_yes = ["Y","YES","1","T","TRUE"]
    if os.environ.get("test_mode") is None:
        print("Error: test mode variable is None")
    else:
        this_is_a_test = os.environ.get("test_mode")
        if this_is_a_test in definitiion_of_yes:
            print("Executing in Test mode")
            required_variables_exists()
            testPostgresConnection()
            # Vault disabled
            # testVault()
        else:            
            print("Starting main process ...")
            # main()

