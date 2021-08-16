module.exports.validate = function(req) {
   let conversationId = req.header("x-grid");
   if(conversationId) {
       return true;
   }
   return false;
}