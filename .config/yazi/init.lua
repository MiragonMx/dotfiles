function Linemode:perm_sz_mtime()
	-- local time = math.floor(self._file.cha.mtime or 0)
	-- if time == 0 then
	-- 	time = ""
	-- elseif os.date("%Y", time) == os.date("%Y") then
	-- 	time = os.date("%b %d %H:%M", time)
	-- else
	-- 	time = os.date("%b %d  %Y", time)
	local time = self._file:mtime()
	local size = self._file:size()
	local perm = self._file:permissions()
	return string.format("%s %s %s", size and ya.readable_size(size) or "-", time, perm)
end

-- Activate plugins
require("full-border"):setup()
