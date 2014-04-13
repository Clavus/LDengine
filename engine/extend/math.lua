
function math.dist( x1, y1, x2, y2 )

	local xd = x2-x1
	local yd = y2-y1
	return math.sqrt( xd*xd + yd*yd )
	
end

math.distance = math.dist -- alias

function math.clamp( num, low, high )

	return num < low and low or (num > high and high or num)
	
end

function math.randomRange( low, high )

	return low + (math.random() * (high-low))
	
end

function math.sign( x )

	return x < 0 and -1 or 1
	
end

function math.round( i, decimals )

	local mul = 10^(decimals or 0)
    return math.floor(i * mul + 0.5) / mul
	
end

function math.approach( cur, target, inc ) -- sets <inc> step from <cur> to <target>

	inc = math.abs( inc )

	if (cur < target) then
		return math.clamp( cur + inc, cur, target )
	elseif (cur > target) then
		return math.clamp( cur - inc, target, cur )
	end

	return target
	
end

function math.lerp(a, b, frac) -- <frac> is in the range of 0 to 1

	assert(frac <= 1 and frac >= 0, "Lerp fraction has to be between 0 and 1")
	return a + (b - a) * frac

end

function math.smooth(a, b, frac) -- same as math.lerp but with cosine interpolation

	local m = (1 - math_cos(lume.clamp(frac, 0, 1) * math_pi)) / 2
	return a + (b - a) * m
	
end

-- normalizes angle to be between 180 and -179 degrees
function math.normalizeAngle( a )

	while (a <= -math.pi) do
		a = a + math.pi*2
	end
	
	while (a > math.pi) do
		a = a - math.pi*2
	end

	return a
	
end


function math.angleDifference( a, b )

	local diff = math.normalizeAngle( a - b )
	
	if ( diff < math.pi ) then
		return diff
	end
	
	return diff - math.pi

end

function math.approachAngle( cur, target, inc )

	local diff = math.angleDifference( target, cur )
	return math.approach( cur, cur + diff, inc )
	
end

