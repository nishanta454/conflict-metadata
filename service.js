const db = require('./db')

const process_req = async (conversationId, req_payload) => {
    let response = {}
    let emails = req_payload.emails
    if (emails && emails.length > 0) {
        let promises = []
        for (const email of emails) {
            promises.push(process_email(conversationId, email))
        }
        response.emails = await Promise.allSettled(promises)
    }
    return response
}

const process_email = async (conversationId, email_conflicts) => {
    let email_response = {}
    let conflicts = email_conflicts['conflict-codes']
    if (conflicts && conflicts.length > 0) {
        email_response['conflict-codes'] = []
        let promises = []
        for (const conflict of conflicts) {
            promises.push(process_conflict(conversationId, conflict))
        }
        email_response['conflict-codes'] = await Promise.allSettled(promises)
    }
    return email_response
}

const process_conflict = async (conversationId, conflict) => {
    let query = "select * from metadata_db.tbl_meta_ref_source_system where name = $1 and description = $2 and src_system_sgk = $3"
    let rows = await db.execute(query,  [conflict.conflictCode, conflict.fieldName, conflict.alertId])
    if(rows) {
        console.log(rows)
    }
    return conflict
}

module.exports.process = process_req