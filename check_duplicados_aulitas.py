import ldap3 # Será necesario instalarlo
import sys, os, getopt 
from ldap3 import ALL,MODIFY_ADD, MODIFY_REPLACE, MODIFY_DELETE
import getpass


if __name__ == "__main__":

    ldappass = ''
    try:
        opts, args = getopt.getopt(sys.argv[1:],"hp:",["pass="])
    except getopt.GetoptError:
        print('python check_duplicados_aulitas.py -p <ldap-password>')
    for opt, arg in opts:
        if opt in ('-p','--pass'):
            ldappass = arg
        elif opt in ('-h', '--help'):
            print('python check_duplicados_aulitas.py -p <ldap-password>')
            sys.exit()
        else:
            print('python check_duplicados_aulitas.py -p <ldap-password>')
            sys.exit()

    ldap_server = ldap3.Server('ldap.fcen.uba.ar', get_info=ldap3.ALL)
    conn = ldap3.Connection(ldap_server, user="cn=admin,dc=exactas,dc=uba,dc=ar", password=ldappass, auto_bind=True)

    baseDN = 'ou=Personas,ou=Usuarios,dc=exactas,dc=exactas,dc=uba,dc=ar'
    search_filter = '(|(objectClass=sambaSamAccount)(objectClass=samba))'
    retrieve_attributes = ['uid','Activo']

    conn.search(baseDN, search_filter, attributes = retrieve_attributes)

    entradas = conn.entries
    result_dict = {}
    result_set = []
    contador = 0

    for entry in entradas:
        dn_actual = entry.entry_dn
        if entry.Activo.value=='0': # Si no está activo, ignorar.
            continue
        if isinstance(entry.uid.value,str): # A veces el uid es uno solo
            uid = [entry.uid.value]
        else: # Otras veces es una lista
            uid = entry.uid.value
    
        for item in uid:
            if item in result_dict:
                result_dict[item].append(dn_actual)
            else:
                result_dict[item]=[dn_actual]
    
    for key,value in result_dict.items():
        if len(value)>1:
            sys.exit(2)

    sys.exit(0)
