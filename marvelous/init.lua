--[[  ]]

local Marvelous = {}

function Marvelous.new(init)
    local cls, mt, parameters = {}, {}, {}
    cls.mt         = mt
    cls.parameters = parameters

    function mt:__index(k)
        local param = parameters[k]
        if param then
            return param.get(self)
        elseif cls[k] then
            return cls[k]
        elseif init then
            return init.mt.__index(self, k)
        else
            return nil
        end
    end

    function mt:__newindex(k,v)
        local param = parameters[k]
        if param then
            return param.set(self, v)
        elseif init then
            return init.mt.__newindex(self, k,v)
        else
            rawset(self, k,v)
        end
    end

    function cls:new(...)
        local obj = setmetatable({}, self.mt)
        if obj.__new then obj:__new(...) end
        -- obj:__new(...)
        return obj
    end

    return cls
end

return Marvelous
