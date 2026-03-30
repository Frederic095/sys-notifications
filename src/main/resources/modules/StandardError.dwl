output json

---

{
    correlationId: vars.metadata.correlationId,
    statusCode: vars.httpStatus,
    namespace: error.errorType.namespace,
    identifier: error.errorType.identifier,
    description: error.errorMessage.payload default vars.description default error.description
}