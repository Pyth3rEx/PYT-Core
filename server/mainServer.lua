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

--[[ Server Callback: PYT-Core:Server:RessourceChecker
    Description:
        Will check an list of ressources to see if they are started
    Argument:
        ressources [table] [string]: list of ressources to check (may be a single ressource as a string)
    Returns:
        startedRessources [table]: list of started ressource(s)
        false: none of the given ressource(s) is/are started
        nil: improper input given
]]--
lib.callback.register('PYT-Core:Server:RessourceChecker', function (source, ressources)
    -- Ensure the input is valid
    if type(ressources) ~= 'table' and type(ressources) == 'string' then
        ressources = {ressources}
    elseif type(ressources) ~= 'table' then
        error("Invalid resources input. Expected a table.", 0)
        return nil
    end
    local startedRessources = {}
    for _, ressource in ipairs(ressources) do
        
        if 'started' == GetResourceState(ressource) then
            table.insert(startedRessources, ressource)
        end
    end
    if nil == next(startedRessources) then return false end
    return startedRessources
end)

--[[ Server Callback: PYT-Core:Server:TableToString
    Description:
        Will turn a table into a string (good for error printing lol)
    Argument:
        initialTable [table]: table to convert into a string
        delimiter [string]: delimiter to put between each element (for example a space)
    Returns:
        resultingString [string]: resulting string
]]--
lib.callback.register('PYT-Core:Server:TableToString', function (source, initialTable, delimiter)
    local resultingString = ''
    for element, _ in ipairs(initialTable) do
        resultingString = resultingString .. tostring(delimiter) .. tostring(initialTable[element])
    end
    return resultingString
end)