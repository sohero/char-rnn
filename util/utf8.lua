local utf8 = {}

function utf8:read(filename)
	file = io.open(filename, 'r')
	local c1, ctr, c, d
	local text = {}
	c1 = file:read(1)
	while c1 do 
		ctr, c = -1, math.max(c1:byte(), 128)
		repeat
		    ctr = ctr + 1
		    c = (c - 128)*2
		until c < 128
		d = file:read(ctr)
		if d then
			text[#text+1] = c1 .. d
			c1 = file:read(1)
		else
			break
		end
	end
	file:close()
	return text
end

return utf8