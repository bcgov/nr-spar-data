import logging
#import cx_Oracle
import oracledb
from sqlalchemy import create_engine, text

logger = logging.getLogger(__name__)

class database_connection(object):
    """ Class used to control database connections. """
    def __init__(self, database_config: str):
        self.conn = None
        self.engine = None
        self.database_config = database_config
        self.database_type = database_config['type']
        self.conn_string = self.format_connection_string(database_config)

    def __enter__(self):
        if self.conn_string == 'ORACLE':
            self.engine = self.get_oracle_engine()
        else:
            self.engine = create_engine(self.conn_string)
        self.conn = self.engine.connect().execution_options(autocommit=False)
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        self.engine.dispose()
    
    def execute(self, query, params):
        """ Runs a SQL statement. """
        self.conn.execute(text(query), params)
        
    def select(self, query, params=None):
        """ Runs a SQL statement. """
        result = self.conn.execute(text(query), params)
        return result
        
    def health_check(self) -> bool:
        """ Runs a simple query to check if database is still active/working. """
        query = 'SELECT 1' 
        if self.database_type == 'ORACLE':
            query = ' '.join([query, 'FROM DUAL'])
        
        try:            
            self.conn.execute(text(query))
        except:
            logger.critical('Connection health check resulted in an error', exc_info=True)
            return False
        else:
            return True
    
    def commit(self):
        """ Runs a SQL statement. """
        self.conn.commit()
        
    def rollback(self):
        """ Runs a SQL statement. """
        self.conn.rollback()
        
    def get_oracle_engine(self):
        import ssl
        import oracledb
        dbc = self.database_config # alias
        ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLSv1_2)
        ssl_context.set_ciphers('DEFAULT@SECLEVEL=1')
        #connection = oracledb.connect(user=dbc['username'], password=dbc['password'],dsn=f"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCPS)(HOST={dbc['host']})(PORT={dbc['port']}))(CONNECT_DATA=(SERVICE_NAME={dbc['service_name']})))",externalauth=False, ssl_context = ssl_context)
        return create_engine(f'oracle+oracledb://:@',
                        connect_args={
                            "user": dbc['username'],
                            "password": dbc['password'],
                            "dsn": f"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCPS)(HOST={dbc['host']})(PORT={dbc['port']}))(CONNECT_DATA=(SERVICE_NAME={dbc['service_name']})))",
                            "externalauth":False,
                            "ssl_context": ssl_context
                        })
        
    def format_connection_string(self, database_config: str):
        """ Formats the connection string based on the database type and the connection configuration. """
        if database_config['type'] == 'ORACLE':
            return 'ORACLE'

        if database_config['type'] == 'POSTGRES':
            connection_string = 'postgresql+psycopg2://{}:{}@{}:{}/{}'.format(
                database_config['username'], 
                database_config['password'], 
                database_config['host'], 
                database_config['port'],
                database_config['database'])

        return connection_string