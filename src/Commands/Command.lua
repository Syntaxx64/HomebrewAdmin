local hbAdmin = script:FindFirstAncestor("HomebrewAdmin")
local Maid = require(hbAdmin.Util.Maid)

local Command = {
    __type = "Command"
}
Command.__index = Command

local executorMaid = Maid.new()

function Command.new(Title, Desc, Args, Alternatives, Func)
    local self = setmetatable({
        _name = Title,
        _args = Args,
        _desc = Desc,
        _alias = Alternatives,
        _executor = Func
    }, Command)


    return self
end

function Command:Execute(Args)
    local executor = self._executor
    local args = Args
    executorMaid:GiveTask(function()
        executor(args)
    end)
end

function Command:GetName()
    return self._name
end

function Command:GetDescription()
    return self._desc
end

function Command:GetArguments()
    return self._args
end

function Command:GetAliases()
    return self._alias
end

return Command