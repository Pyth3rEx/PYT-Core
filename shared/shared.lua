--[[ export: debugPrinter
    Description:
        Will print a debug message to the server if no targetID is given
        Will send the message to the specified client(s) if a targetID is given
    Argument:
        message [string]: message to be printed to the client
        targetID [integer]: Id of the client to sent the debug message to (-1 for all clients)
]]--
exports('debugPrinter', function (message, targetID)
    if true == Config.Modules.Debug then
        local isForServer = false
        if nil == targetID then
            isForServer = true
        end
        TriggerServerEvent('PYT-Core:Server:DebugPrinter', message, isForServer, targetID)
    end
end)

--[[ export: ressourceChecker
    Description:
        Will check a table of ressources for their state
    Argument:
        ressources [table]: list of ressources to check (may be a single ressource)
        isForServer [boolean]: is the request for the server
    Returns:
        startedRessources [table]: list of started ressource(s)
        false: none of the given ressource(s) is/are started
]]--
exports('ressourceChecker', function (source, ressources, isForServer)
    if true == Config.Modules.RessourceChecker then
        local startedRessources
        if true == isForServer then
            startedRessources = lib.callback.await('PYT-Core:Server:RessourceChecker', source, ressources)
        else
            startedRessources = lib.callback.await('PYT-Core:Client:RessourceChecker', false, source, ressources)
        end
        return startedRessources
    end
end)