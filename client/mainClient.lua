--[[ Client Event: PYT-Core:Client:DebugPrinter
    Description:
        Will print a debug message to the client
    Argument:
        message [string]: message to be printed to the client
]]--
RegisterNetEvent('PYT-Core:Client:DebugPrinter')
AddEventHandler('PYT-Core:Client:DebugPrinter', function (message)
    print(tostring(message))
end)

--[[ Client Callback: PYT-Core:Client:RessourceChecker
    Description:
        Will check an list of ressources to see if they are started
    Argument:
        ressources [table]: list of ressources to check (may be a single ressource)
    Returns:
        startedRessources [table]: list of started ressource(s)
        false: none of the given ressource(s) is/are started
]]--
lib.callback.register('PYT-Core:Client:RessourceChecker', function (ressources)
    print('also...')
    local startedRessources = {}
    for _, ressource in ipairs(ressources) do
        
        if 'started' == GetResourceState(ressource) then
            table.insert(startedRessources, ressource)
        end
    end
    if nil == next(startedRessources) then return false end
    return startedRessources
end)

