--[[ export: debugPrinter
    Description:
        Will print a debug message to the server if no targetID is given
        Will send the message to the specified client(s) if a targetID is given
    Argument:
        message [string]: message to be printed to the client
        targetID [integer]: Id of the client to sent the debug message to (-1 for all clients)
]]--
exports('debugPrinter', function (message, targetID)
    local isForServer = false
    if nil == targetID then
        isForServer = true
    end
    TriggerServerEvent('PYT-Core:Server:DebugPrinter', message, isForServer, targetID)
end)