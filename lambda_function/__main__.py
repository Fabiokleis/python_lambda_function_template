## lambda function

import logging

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)


# function called in Dockerfile
def lambda_handler(event, context):
    logger.debug('lambda handler invoked')
    return {'message': 'Hello, World!'}

