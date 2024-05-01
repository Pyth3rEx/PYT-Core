--[[ Client Event: PYT-Core:Server:DebugPrinter
    Description:
        Will print a debug message to the server if no targetID is given
        Will send the message to the specified client(s) if a targetID is given
    Argument:
        message [string]: message to be printed to the client
        isForServer [boolean]: is the message meant for the server
        targetID [integer]: Id of the client to sent the debug message to (-1 for all clients)
]]--
RegisterNetEvent('PYT-Core:Server:DebugPrinter')
AddEventHandler('PYT-Core:Server:DebugPrinter', function (message, isForServer, targetID)
    if true == Config.Modules.Debug then
        if false == isForServer then 
            TriggerClientEvent('PYT-Core:Client:DebugPrinter', targetID, message)
            return
        end
        print(tostring(message))
    end
end)